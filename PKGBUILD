# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0s-bin
pkgver=1.29.2+k0s.0
pkgrel=1
pkgdesc="k0s - Zero Friction Kubernetes"
arch=('x86_64')
url="https://github.com/k0sproject/k0s"
license=('Apache')
source=("https://github.com/k0sproject/k0s/releases/download/v${pkgver}/k0s-v${pkgver}-amd64")
sha256sums=('3511344dcf63e56d5286b230b7993965cb05b27bdb721780c2037339ccd8fcbd')
options=(!strip)

package() {
  install -Dm 755 "$srcdir/k0s-v${pkgver}-amd64" "$pkgdir/usr/bin/k0s"

  "$pkgdir/usr/bin/k0s" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/k0s"
  "$pkgdir/usr/bin/k0s" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_k0s"
  "$pkgdir/usr/bin/k0s" completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/k0s.fish"
}
