# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.7.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('43f6ef531b448620066905267cc4341294110f993e04ad743cd7e28acc4a03b77057a4b784433d8bb1dbd7e4fdc26a72651d336d4b53310c4ce55a67ef39072f')
sha512sums_x86_64=('4b2f69585a60bea5afbf29ac19a31f8a3f3bab6add4511c6c45b33748f63ffa581a4d5cc24293c83e4ca970ebaad43dab162209faed90c954d8c3edc15d356e9')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
}
