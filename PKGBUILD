# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.4.5
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('dd2f3384cc7e8c20baffffab202fad5e965842faa6cf4ec21cb59ccfc9943191')
sha256sums_aarch64=('f1bf81b9fa582fc47b5fe45f63fa56a799c42beae153a19dd5c480f9dbec7912')

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
