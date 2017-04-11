# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=kubernetes-helm
pkgver=2.3.0
pkgrel=1
pkgdesc="A tool to manage Kubernetes charts"
arch=('i686' 'x86_64')
url="https://github.com/kubernetes/helm"
depends=('socat')
optdepends=('kubectl-bin: Check Kubernetes status')
license=('Apache')
source_i686=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-386.tar.gz")
source_x86_64=("https://kubernetes-helm.storage.googleapis.com/helm-v$pkgver-linux-amd64.tar.gz")
sha512sums_i686=('d7faf979d6cb6aeccad5191e46b8f2ba733b540e75922b13a24cd8a5ea23f51e3caefac1a661f08df7d48e8629e3084a0bf62838e47815f5a3e460a6e5629e0d')
sha512sums_x86_64=('16c7fc369c0299240d19154137560dff3738d680958198b624b261521d10a9ef96d80e38d23f243925bf443bda41def0f0f962cdd39b7592da1b8a3365932495')

package() {
    cd "$srcdir"
    install -d "$pkgdir/usr/bin"
    install -m755 linux-*/helm "$pkgdir/usr/bin/helm"
}
