# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>
# Co-Maintainer: Pascal Reeb <pascal@reeb.io>

pkgname=talosctl-bin
pkgver=1.13.4
pkgrel=1
pkgdesc="talosctl - utility for controling Talos"
arch=('x86_64')
url="https://github.com/siderolabs/talos"
license=('MPL-2.0')
source=("talosctl-linux-amd64-v${pkgver}::https://github.com/siderolabs/talos/releases/download/v${pkgver}/talosctl-linux-amd64")
sha256sums=('aae1dadd238f9dfbc9790d117a114424b2d59200ee12872d0d9f89e178a69aae')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/talosctl-linux-amd64-v${pkgver}" "$pkgdir/usr/bin/talosctl"

  "$pkgdir/usr/bin/talosctl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/talosctl"
  "$pkgdir/usr/bin/talosctl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_talosctl"
  "$pkgdir/usr/bin/talosctl" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/talosctl.fish"
}
