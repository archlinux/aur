# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.3.1
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('b67377650c1d03c6018c7b09069380b46644be3c60104a3717543094d2adb91aa23aa7e8f5a442927f4ea810210f9630f395b9a72339cea2ed96d0415213f062')
sha512sums_x86_64=('e507aa6784b007bc6387f260761a435a4cf32af59ae6bce2ebb6d496114f4a30b2ba19821a160674d90b558c4ddf9e2f219693a2f53c4c0a26a69e7941c63ddf')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}
