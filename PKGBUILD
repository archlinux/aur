# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.9.1
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('31bc2e2f7e91a5a9ff8a6e9735d87b70418baff7e920c22882f65fd2ee8a1f2f601abefe48d02c3c178c27a6dda5cd7b233b677bfb9e4d05cb5c3ef574fbb2f4')
sha512sums_x86_64=('a6c7767dadaeaa2328eee4ad98d12f933333dc948a3d984d98e876a7761951466d7b58027885dc284a8509855fb935fd74d0d255b8271298c2cdbd757df92bb7')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
}
sha512sums_i686=('31bc2e2f7e91a5a9ff8a6e9735d87b70418baff7e920c22882f65fd2ee8a1f2f601abefe48d02c3c178c27a6dda5cd7b233b677bfb9e4d05cb5c3ef574fbb2f4')
sha512sums_x86_64=('a6c7767dadaeaa2328eee4ad98d12f933333dc948a3d984d98e876a7761951466d7b58027885dc284a8509855fb935fd74d0d255b8271298c2cdbd757df92bb7')
