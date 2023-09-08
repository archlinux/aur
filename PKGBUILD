# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.8.22
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('9ac84bd79af1bb8fde49a1642d0c224f5f7ed8bedc2dd8236a20adf9f1083b48')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"

  "$pkgdir/usr/bin/ctlptl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ctlptl"
  "$pkgdir/usr/bin/ctlptl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ctlptl"
  "$pkgdir/usr/bin/ctlptl" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/ctlptl.fish"
}
