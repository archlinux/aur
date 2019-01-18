# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texinfo-js
pkgver=0.0.90
pkgrel=2
pkgdesc="Info-like interface for reading documentation in a web browser"
url="https://alpha.gnu.org/gnu/texinfo/"
arch=('any')
license=('GPL')
depends=('bash')
source=(https://alpha.gnu.org/gnu/texinfo/$pkgname-$pkgver.tar.gz)
sha256sums=('e5a7c780540b0334d0daf56729255272c95992253af83fe90e8826eb0ab3b52c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
