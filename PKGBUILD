# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kube-commander
pkgver=0.5.5rc.2
pkgrel=3
pkgdesc="kubecom is terminal UI for easy interaction with Kubernetes"
url="https://github.com/AnatolyRugalev/kube-commander"
license=('MIT')
arch=('x86_64')
depends=('kubectl')

source=("kubecom_$pkgver::https://github.com/AnatolyRugalev/kube-commander/releases/download/${pkgver}/kubecom_${pkgver}_linux_amd64" 'kube-commander')
sha256sums=('80e56fac11f58627a3b6e53c625da2e5f4d176edd6128d883aa28b9a6832c568' 'a51f5f19cce7700895f32ab96e6cf167e184e0f7e7ebe5b228c5e9283672d459')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 kube-commander "$pkgdir/usr/bin/kube-commander"
  install -m755 kubecom_$pkgver "$pkgdir/usr/bin/kubecom"
}
