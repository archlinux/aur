# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=warp-gui
pkgver=0.0.1
pkgrel=1
pkgdesc="A GUI application based on warp-cli for linux written in Rust"
arch=('x86_64')
url="https://github.com/progzone122/warp-cloudflare-gui-rust"
options=(!lto)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'cloudflare-warp-bin'
  'qt6-base'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=(
  "https://github.com/progzone122/warp-cloudflare-gui-rust/releases/download/$pkgver/warp-gui"
)
sha256sums=("e06d73737e78951ad66fad41ef9866426598883710aba7eb52641005678b1998")

build() {
  :
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/warp-gui" "$pkgdir/usr/bin/warp-gui"
  chmod +x "$pkgdir/usr/bin/warp-gui"

  # start warp-cli systemd service
  sudo systemctl enable warp-svc.service --now

}