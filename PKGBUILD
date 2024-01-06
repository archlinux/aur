# Maintainer: Elias Werberich <elias at werberich dot de>
# Contributor: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio-bin
pkgver=5.0.11
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
provides=('kubectl-minio')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('7bd06db227b26b8b0a454cd543d5bf370a69687c2524405619bfc5ec80c26ba4')
sha256sums_aarch64=('3fb31819fccfe7d921131c31e70fe8e82c23a0a1698e120a067ab46111b3a14d')

package() {
    cd "$srcdir"

    case $arch in
        x86_64)
            install -Dm755 "kubectl-minio_${pkgver}_linux_amd64" "$pkgdir/usr/bin/kubectl-minio"
        ;;
        aarch64)
            install -Dm755 "kubectl-minio_${pkgver}_linux_arm64" "$pkgdir/usr/bin/kubectl-minio"
        ;;
    esac
}
