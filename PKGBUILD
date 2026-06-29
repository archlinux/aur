pkgname=augenblick-bin
pkgver=0.2.1
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

sha256sums_x86_64=("a43de1ee2d1c1ad9f7db38e1b9609d550a584eff14bfb4295ff2971ee2bbafb5")
sha256sums_aarch64=("9bcb28985b852fcd33af378de21c86b30fa1cfdb0e941e73315104508bbd2ea6")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 augenblick "$pkgdir/usr/bin/augenblick"
}
