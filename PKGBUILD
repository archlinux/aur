# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor:
pkgname=c-intro-and-ref
pkgver=0.1
pkgrel=1
pkgdesc="GNU C Language Introduction and Reference Manual"
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GFDL-1.3-or-later')
makedepends=('texlive-latex')
optdepends=('texinfo: to view documentation in info format')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e399ad9e5cb3d91b98524e09cdafa5646181c5ece98914bfbfbd31c7588ac444')

build() {
  cd ${pkgname}-${pkgver}/
  ./configure --prefix=/usr
  make clean
  make
}

package() {
  cd ${pkgname}-${pkgver}/
  make DESTDIR="$pkgdir" install
}
