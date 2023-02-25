# Maintainer: Jules Maselbas <jmaselbas@zdiv.net>
pkgname=wch-isp
pkgver=0.2.2
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
sha256sums=('eae323b1b285459058f71ab3bddbd6d94acf2883547fac9c9a8af660236dcebb')
