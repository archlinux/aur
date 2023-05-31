# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ctlptl-bin
pkgver=0.8.19
pkgrel=1
pkgdesc="Making local Kubernetes clusters fun and easy to set up"
arch=('x86_64')
url="https://github.com/tilt-dev/ctlptl"
license=('Apache')
source=("https://github.com/tilt-dev/ctlptl/releases/download/v${pkgver}/ctlptl.${pkgver}.linux.x86_64.tar.gz")
sha256sums=('1256ce4b6daedf6cfaa1f21d0bfbde7d4faceefce650eb6728cd4baedfdd7ff4')

package() {
  install -Dm 755 "$srcdir/ctlptl" "$pkgdir/usr/bin/ctlptl"

  "$pkgdir/usr/bin/ctlptl" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/ctlptl"
  "$pkgdir/usr/bin/ctlptl" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_ctlptl"
}
