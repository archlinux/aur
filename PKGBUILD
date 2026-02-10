# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>

pkgname=talosctl-bin
pkgver=1.12.3
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL-2.0')
source=("talosctl-linux-amd64-v${pkgver}::https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('1b761b351964dcf764d3ec1a02ccd366428be22895a68dc641b6b4fa301589ed')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64-v${pkgver}" "$pkgdir/usr/bin/talosctl"

  "$pkgdir/usr/bin/talosctl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/talosctl"
  "$pkgdir/usr/bin/talosctl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_talosctl"
  "$pkgdir/usr/bin/talosctl" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/talosctl.fish"
}
