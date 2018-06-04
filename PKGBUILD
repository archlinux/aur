# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=ark-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Backup client for Kubernetes"
arch=('x86_64')
url="https://github.com/heptio/ark"
optdepends=('kubectl-bin: To connect to Kubernetes')
license=('Apache')
source=("https://github.com/heptio/ark/releases/download/v${pkgver}/ark-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('6ce965c1ae715e3153ae920af2fff4c4319fb8e137159a786d2993ecf63c660e')

package() {
  cd "$srcdir"
  install -Dm 755 ark "$pkgdir/usr/bin/ark"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/ark" completion bash > "$pkgdir/usr/share/bash-completion/completions/ark"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/ark" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_ark"
}
