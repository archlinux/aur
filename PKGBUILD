pkgname=edcltool-git
pkgver=20150730
pkgrel=1
pkgdesc="edcl scripting tool"
url="https://github.com/RC-MODULE/edcltool"
arch=('any')
license=('unknown')
depends=('lua')
makedepends=('git')
source=("git+https://github.com/RC-MODULE/edcltool.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/edcltool"
  ./bootstrap
  ./configure --prefix=/usr --datarootdir=${pkgdir}/usr/local/share
  make
}

package() {
  cd "${srcdir}/edcltool"
  make DESTDIR="${pkgdir}" install
}

