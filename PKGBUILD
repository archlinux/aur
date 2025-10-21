
# Maintainer: xifan <xifan2333@gmail.com>
pkgname=unibarrage-bin
_pkgname=unibarrage
pkgver=1.0.1
pkgrel=1
pkgdesc="High-performance real-time proxy tool to unify live barrage data collection across multiple streaming platforms"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/UniBarrage"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("UniBarrage-linux-amd64.tar.gz::https://github.com/xifan2333/UniBarrage/releases/download/v1.0.1/UniBarrage-linux-amd64.tar.gz")
source_aarch64=("UniBarrage-linux-arm64.tar.gz::https://github.com/xifan2333/UniBarrage/releases/download/v1.0.1/UniBarrage-linux-arm64.tar.gz")
sha256sums_x86_64=('c88e5e1242caeb878a04676d1ac6af72166ce57cd09ead47c4351dc127ebdd04')
sha256sums_aarch64=('SKIP')

package() {
	cd "${srcdir}"

	local binary
	case "${CARCH}" in
		x86_64) binary="UniBarrage-linux-amd64" ;;
		aarch64) binary="UniBarrage-linux-arm64" ;;
	esac

	# Install binary
	install -Dm755 "${binary}" "${pkgdir}/usr/bin/${_pkgname}"
}
