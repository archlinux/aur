# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=acarsdec
pkgver=3.7
pkgrel=1
pkgdesc="Multi-channel ACARS decoder"
arch=('x86_64')
url="https://github.com/TLeconte/acarsdec"
license=('GPL-2.0-only')
depends=('airspy' 'rtl-sdr')
makedepends=('cmake')
optdepends=('acarsserv: Store messages in sqlite database')
source=("https://github.com/TLeconte/acarsdec/archive/$pkgbase-$pkgver.tar.gz")
sha256sums=('1cb8cab03642bfdfcefb7b003f292cfac0f11051ff07666e714bbb4905717005')

build() {
  cmake -S "$pkgname-$pkgver" -B build \
    -DAIRSPY=ON \
    -DRTLSDR=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

