# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>

pkgname=omi
pkgver=1.9.0_0
pkgrel=2
pkgdesc='Open Management Infrastructure (OMI) is an open source project to further the development of a production quality implementation of the DMTF CIM/WBEM standards.'
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/omi'
license=('MIT')
makedepends=('lsb-release')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/Microsoft/omi/archive/v${pkgver//_/-}.tar.gz")
sha256sums=('42227b31f6e6e20079a635bb7b3789a21541027169e7958fb868aa30cfcef32d')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}/Unix"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}/Unix"
  make install DESTDIR="$pkgdir"

  install -Dm 644 "$srcdir/$pkgname-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
