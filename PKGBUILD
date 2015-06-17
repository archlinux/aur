# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=tegrarcm
pkgver=1.6
pkgrel=1
pkgdesc='Tegra ReCovery Mode tool; communicates with Tegra boot ROM to download code over USB'
arch=(i686 x86_64)
url='https://github.com/NVIDIA/tegrarcm'
license=(custom)
depends=(crypto++ libusb)
source=(tegrarcm-$pkgver.zip::https://github.com/NVIDIA/tegrarcm/archive/v$pkgver.zip)
sha1sums=('bad9aeed48dab24c7176ce07b1684be29887543d')

build() {
  cd tegrarcm-$pkgver
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd tegrarcm-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
