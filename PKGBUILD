pkgname=edcltool-git
pkgver=0.2.5.r11.gad559f3
pkgrel=1
pkgdesc="edcl scripting tool"
url="https://github.com/RC-MODULE/edcltool"
arch=('any')
license=('unknown')
depends=('lua')
makedepends=('git' 'cmake')
source=("git+https://github.com/RC-MODULE/edcltool.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/edcltool"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/edcltool"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/edcltool"
  make DESTDIR="${pkgdir}" install
}

