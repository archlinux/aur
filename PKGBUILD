# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.5.0
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('7e215bcd267bb9815598e5719a32eb9478bde5420b161ed4409ccaa828f37d55')
sha256sums_aarch64=('e0034fa7a2b365a47e0364078aff40671da5630094abbe57395bbc52027c4872')

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
