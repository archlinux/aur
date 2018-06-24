# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=acarsdec
pkgver=3.4
pkgrel=1
pkgdesc="Multi-channel ACARS decoder for rtl_sdr"
arch=('x86_64')
url="https://github.com/TLeconte/acarsdec"
license=('GPL')
depends=('alsa-lib' 'libsndfile' 'rtl-sdr')
source=("https://github.com/TLeconte/acarsdec/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('1db09410ea58f1a8f65f4310f94c2fef419c38f4d05c723de9b2e77a6f936e1f')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  make
  make acarsserv
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 acarsdec "$pkgdir/usr/bin/acarsdec"
  install -Dm755 acarsserv "$pkgdir/usr/bin/acarsserv"
}
