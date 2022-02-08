# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.4.7
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('9731fe5f587d9e873dba41b7646d62acf8aa359f292b0a81e31f5769088193e6')
sha256sums_aarch64=('a38b009b026b611c0354f7114cb2b6b26bf66dea3dc2ed341f33d68e832865c1')

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
