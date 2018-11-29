pkgname=bwbasic
pkgver=3.20
pkgrel=2
pkgdesc="Bywater BASIC"
arch=('armv6h' 'i686' 'x86_64')
url="https://sourceforge.net/projects/bwbasic"
license=('GPL')
makedepends=('dos2unix')
source=('https://sourceforge.net/projects/bwbasic/files/bwbasic/version%203.20/bwbasic-3.20.zip')
md5sums=('fd4bf69515e62d1c92aa3f47038d034b')

prepare() {
  mkdir -p "${pkgdir}"/usr/share/doc/bwbasic

  cd "${srcdir}"
  dos2unix configure
  chmod +x configure
}

package() {
  cd "${srcdir}"
  ./configure
  make

  cd "${srcdir}"
  install -Dvpm755 bwbasic "${pkgdir}"/usr/bin/bwbasic
  install -Dvpm644 README "${pkgdir}"/usr/share/doc/bwbasic/README
  install -Dvpm644 bwbasic.doc "${pkgdir}"/usr/share/doc/bwbasic/bwbasic.doc
  install -Dvpm644 DOCS/* "${pkgdir}"/usr/share/doc/bwbasic/
}
