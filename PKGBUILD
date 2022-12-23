# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.8.15
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('9bf19022b56a12bfbcd84da16aa0b4b0eea577e95ca04da91eaaedbd101199c5')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"

  "$pkgdir/usr/bin/ctlptl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ctlptl"
  "$pkgdir/usr/bin/ctlptl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ctlptl"
}
