# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.8.32
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache-2.0')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('31a7890437ffac52a48672784df3c8249142770c95ba68da21963c40eb49be69')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"

  "$pkgdir/usr/bin/ctlptl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ctlptl"
  "$pkgdir/usr/bin/ctlptl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ctlptl"
  "$pkgdir/usr/bin/ctlptl" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/ctlptl.fish"
}
