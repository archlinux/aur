# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.15.5
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache')
source=("k0sctl-linux-x64-$pkgver::https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-x64")
sha256sums=('62f70e3f524bd88fa3126eb123ad40ef559e9ca2d0511f8c36fe553a0d33b0c2')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0sctl-linux-x64-$pkgver" "$pkgdir/usr/bin/k0sctl"

  "$pkgdir/usr/bin/k0sctl" completion --shell bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/k0sctl"
  "$pkgdir/usr/bin/k0sctl" completion --shell zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_k0sctl"
  "$pkgdir/usr/bin/k0sctl" completion --shell fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/k0sctl.fish"
}
