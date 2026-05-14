pkgname=gatelet-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="Small ngrok-style HTTP tunnel with a public relay daemon and local client"
arch=('x86_64')
url="https://github.com/alex-oleshkevich/gatelet"
license=('custom:unknown')
depends=('ca-certificates')
optdepends=(
  'wl-clipboard: copy URLs and curl commands from the TUI on Wayland'
  'xclip: clipboard fallback on X11'
)
provides=('gatelet' 'gateletd')
conflicts=('gatelet' 'gateletd')
source_x86_64=("gatelet-$pkgver-linux-amd64.tar.gz::$url/releases/download/v$pkgver/gatelet_linux_amd64.tar.gz")
sha256sums_x86_64=('9373013793077e85588b481132c94a945b49489675d0fa6d68a6642db233766c')

package() {
  install -Dm755 gatelet "$pkgdir/usr/bin/gatelet"
  install -Dm755 gateletd "$pkgdir/usr/bin/gateletd"

  if [[ -f README.md ]]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/gatelet/README.md"
  fi
}
