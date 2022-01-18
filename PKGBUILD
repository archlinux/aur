# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=kubectl-minio
pkgver=4.4.3
pkgrel=1
pkgdesc="Minio plugin for kubectl"
arch=('x86_64' 'aarch64')
url="https://github.com/minio/operator"
license=('AGPL3')
groups=()
depends=('kubectl')
source_x86_64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_amd64")
source_aarch64=("https://github.com/minio/operator/releases/download/v${pkgver}/kubectl-minio_${pkgver}_linux_arm64")
sha256sums_x86_64=('e3a3d2241eb45c1f91b72568af166370ebb936a1e1f67010b4606124fb6ff5aa')
sha256sums_aarch64=('dd518f0da86488553b7eb00c8afc3e66ed36a5e240ef2d16be33a65b90de2aa4')

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
