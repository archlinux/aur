pkgname=augenblick-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Fullscreen eye-blink overlay for X11 (binary package)"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/augenblick"
license=('MIT')
depends=('glibc' 'libxcb')
provides=('augenblick')
conflicts=('augenblick')

source_x86_64=("augenblick-x86_64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("augenblick-aarch64-$pkgver.tar.gz::https://github.com/x71c9/augenblick/releases/download/v$pkgver/augenblick-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=("f1e9ca04437cefc82ed9e496c47aec7a3b3d440e991b570ea1347796de9836d7")
sha256sums_aarch64=("e63fdf64c4b6d639de7ef2cf43a9b0bc784e8dd0de1913122c50de7f21d441d3")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 augenblick "$pkgdir/usr/bin/augenblick"
}
