# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>
# Contributor: Brenton <brenton@taylorbyte.com>
# Contributor: Daniel Menelkir <menelkir at itroll dot org>

pkgname=g15stats
pkgver=3.0.1
pkgrel=2
pkgdesc="A CPU/Mem/Swap/Network monitoring client for G15Daemon."
arch=('i686' 'x86_64')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL')
depends=('g15daemon' 'libgtop' 'libg15' 'libg15render')
source=(https://gitlab.com/menelkir/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha512sums=('ace44632f3beab3a1debb47d319c510723cbf2dc95f0cd732ae2cd9fbf94075515485a612f6273cb188cac1a525bde1cc667e25b0622ef0e57564298fa1555ea')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  echo ""
  echo ""
  echo "You need to install an init script depending on what you're using it."
  echo ""
  echo ""
}
