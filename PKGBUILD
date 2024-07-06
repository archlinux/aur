# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor:
pkgname=c-intro-and-ref
pkgver=0.0
pkgrel=3
pkgdesc="GNU C Language Introduction and Reference Manual"
arch=('any')
url="https://www.gnu.org/software/${pkgname}/"
license=('GFDL-1.3-or-later')
makedepends=('texlive-latex')
optdepends=('texinfo: to view documentation in info format')
source=(https://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d5fa39fd1433e2c4c0ea5638c0162ebee6ec00ffed628621237b10025171eb4a')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}/
  ./configure --prefix=/usr
  make clean
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}/
  make DESTDIR="$pkgdir" install
}
