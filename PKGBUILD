pkgname=scantool-git
pkgver=v2.1.2.r21.gce6257a
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic scanner"
arch=('x86_64')
url="https://github.com/kees/scantool"
license=('GPL')
depends=('allegro4')
conflicts=('scantool')
provides=('scantool')
source=("git+https://github.com/kees/scantool.git")
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/scantool"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/scantool
  make
}

package () {
  cd "${srcdir}"/scantool
  make install DESTDIR="${pkgdir}"
}
