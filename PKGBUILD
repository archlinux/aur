# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.4.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('99bf82e9f0186fbd7dae502d672ef4b98bdf7342011c91150a2fb4ede5e5b40ff461544ee94fbc0741d1910051b604509fd65c529ca880325b679e7344e3c612')
sha512sums_x86_64=('0befa8157b26fefd3f8d9461ee0d982f01f3e5e539601359dff373d5e791edee459c72141c07d5735b01d980259b95062fb5a74039308ff2a73da4bc187a1fea')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}
