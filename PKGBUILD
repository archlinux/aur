# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=velero-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/velero"
optdepends=(
  'kubectl: To connect to Kubernetes'
  'kubectl-bin: To connect to Kubernetes'
)
replaces=('ark-bin')
install="velero-bin.install"
license=('Apache')
source=("https://github.com/heptio/velero/releases/download/v${pkgver}/velero-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('d7398c35d6f8c26b7159c254da93afc8a45e785c815cce7b4938af6fd508932e')

package() {
  install -Dm 755 "$srcdir/velero" -t "$pkgdir/usr/bin"

  "$pkgdir/usr/bin/velero" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/velero"
  "$pkgdir/usr/bin/velero" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_velero"
}
