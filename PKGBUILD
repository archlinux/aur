# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cc65
pkgver=2.17
pkgrel=2
pkgdesc='C compiler for 6502 family microprocessors'
arch=('i686' 'x86_64')
license=('BSD')
url='https://cc65.github.io/cc65/'
source=(https://github.com/cc65/cc65/archive/V${pkgver}.tar.gz)
sha512sums=('b0208db2919e789322c609044c7eb6eae74905f3ec2d25688adc6c1ebe774cd437b0bc73c28032f123ed22ea544550cdd72ae1bc28e3aa7eea8cad3780f56828')

build() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
}
