
# Maintainer: xifan <xifan2333@gmail.com>
pkgname=unibarrage-bin
_pkgname=unibarrage
pkgver=1.0.2
pkgrel=1
pkgdesc="High-performance real-time proxy tool to unify live barrage data collection across multiple streaming platforms"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/UniBarrage"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("UniBarrage-linux-amd64.tar.gz::https://github.com/xifan2333/UniBarrage/releases/download/v1.0.2/UniBarrage-linux-amd64.tar.gz")
source_aarch64=("UniBarrage-linux-arm64.tar.gz::https://github.com/xifan2333/UniBarrage/releases/download/v1.0.2/UniBarrage-linux-arm64.tar.gz")
sha256sums_x86_64=('e8f787c7f58a5fb30a45966e72808c7fffffbdb21758fb3fffbcfb104482d6d8')
sha256sums_aarch64=('b7bc96bebb751c62101c4b2ef2de2a4e8fb4ee8cdb8e41fdc0b70713328cdac1')

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
