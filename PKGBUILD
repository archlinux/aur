pkgname=augenblick-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Fullscreen eye-blink overlay for X11 and Wayland (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/augenblick"
license=('MIT')
depends=('glibc' 'libxcb')
provides=('augenblick')
conflicts=('augenblick')

source_x86_64=("augenblick-x86_64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("augenblick-aarch64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("599a0ea20444727fa86c38845e35842bd6f04be0b280d36e4bb3953abbb664fd")
sha256sums_aarch64=("3bf38746c75e8b286a92ee12ccbcd05a8a3d1bd7e8d8465e826f9d6e7877c948")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "augenblick" "$pkgdir/usr/bin/augenblick"
}
