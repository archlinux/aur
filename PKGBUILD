pkgname=augenblick-bin
pkgver=0.5.2
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

sha256sums_x86_64=("ddc9862cf3e6b442da47be99510d928f8e50ca8699788fade1c70d037f4a90fa")
sha256sums_aarch64=("a852d31bb55fa9b6366b40220053059263bd12776a2cacec40e789f1ba2ed6e1")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "augenblick" "$pkgdir/usr/bin/augenblick"
}
