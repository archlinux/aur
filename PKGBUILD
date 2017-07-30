# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.5.1
pkgrel=2
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('820c531ad2c716fcea0cd78316d1dd0d37d5f8adb81331b69d7ab473e4d39dfb2f650c37427d72c8bb35042a5f0739c098afbaee30110f07de8c5c92f4b7e502')
sha512sums_x86_64=('b2ff0e75459e7eb560e5a08fea364f211095ef9b28f9b5a7c8cf305208ed2007f33119771d29b5c27aea42ad53cc535c3d03d5b2bf7238b94d51d0815d97df55')

package() {
  cd "$srcdir"
  install -Dm 755 linux-*/helm "$pkgdir/usr/bin/helm"
  install -d 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/helm" completion bash > "$pkgdir/usr/share/bash-completion/completions/helm"
  install -d 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/helm" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_helm"
}
