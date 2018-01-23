# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.8.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('fffda99be46ac94ef42f2703b3d1b05a9496f7b142869e02432049e97bff9a0f0a00bc004d0632a60b791e991dc66658d1bca789df7f0699774fd262daa4761c')
sha512sums_x86_64=('d0d5d551d36c9de4f09f5ab1f2eee2d6f57756f7c8fc1d129750a85074861adeec833d693e1cfee23ed0743d36725c9bced40d4b4fbfee37656ab405be9a0508')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
}
