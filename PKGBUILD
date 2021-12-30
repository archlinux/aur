# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.3.9
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('f6ec594af94045e8bb354c41885bde60542f4828cb77965820795d72a489ed6c')
sha256sums_aarch64=('ddb7207c60b361046660d347737f43aafbad6e0669bb2595684c1a0fc56e8d0c')

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