# Maintainer: Jules Maselbas <jmaselbas@zdiv.net>
pkgname=wch-isp
pkgver=0.3.0
pkgrel=1
pkgdesc="Firmware programmer for WCH microcontrollers over USB"
arch=('i686' 'x86_64' 'aarch64')
url="https://git.sr.ht/~jmaselbas/wch-isp/"
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
sha256sums=('7dc6769d2e8581d63f917dbede21a4cc7c807a6ba25d51fd8d8880e468df44b2')
