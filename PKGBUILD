pkgname=augenblick-bin
pkgver=0.3.0
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

sha256sums_x86_64=("3dbafef3bd76efd341e37189af7437d422f26b38a5223066cc711a9538b1defb")
sha256sums_aarch64=("e819ac9769e603ee71addcdc1dbcc0a0619beb9c86faa15712c651ce5a7e6247")

package() {
  if [[ $CARCH == "x86_64" ]]; then
    tar -xzf "augenblick-x86_64-$pkgver.tar.gz"
  elif [[ $CARCH == "aarch64" ]]; then
    tar -xzf "augenblick-aarch64-$pkgver.tar.gz"
  fi
  install -Dm755 "augenblick" "$pkgdir/usr/bin/augenblick"
}
