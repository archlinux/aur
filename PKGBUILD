# Maintainer: sherit45 <sherit45@sherit45@protonmail.com>
pkgname=clevo-led-control
pkgver=1.0.0
pkgrel=3
pkgdesc="Lightweight LED control tool for Monster/Clevo laptops."
arch=('x86_64')
url="https://github.com/sherit45/clevo-led-control"
license=('GPL')
depends=('gcc-libs' 'tuxedo-drivers-nocompatcheck-dkms')
makedepends=('git')
source=("git+https://github.com/sherit45/clevo-led-control.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  g++ -O2 clevo_led.cpp -o cled
}

package() {
  cd "$pkgname"
  install -Dm755 cled "$pkgdir/usr/bin/cled"
  install -Dm644 99-clevo-led.rules "$pkgdir/usr/lib/udev/rules.d/99-clevo-led.rules"
}
