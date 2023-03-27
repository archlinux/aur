# Maintainer: Jules Maselbas <jmaselbas@zdiv.net>
pkgname=wch-isp
pkgver=0.2.4
pkgrel=1
pkgdesc="Firmware programmer for WCH microcontrollers over USB"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/jmaselbas/wch-isp"
license=('GPL2')
groups=()
depends=('libusb>=1.0' 'pkg-config')
makedepends=('make')
optdepends=()
provides=('wch-isp')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://pub.zdiv.net/dist/$pkgname-$pkgver.tar.gz")
noextract=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  make DESTDIR="$pkgdir/" UDEVPREFIX=/usr/lib/udev install-rules
}
sha256sums=('288c51f3e78a0954a0ee80d4ca3b3d744fda21ce17497ef5fa5e37adc0191e98')
