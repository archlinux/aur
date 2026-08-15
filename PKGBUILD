
# Maintainer: xifan <xifan2333@gmail.com>
pkgname=unibarrage-bin
_pkgname=unibarrage
pkgver=1.1.0
pkgrel=1
pkgdesc="High-performance real-time proxy tool to unify live barrage data collection across multiple streaming platforms"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/UniBarrage"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("UniBarrage-linux-amd64.tar.gz::https://github.com/xifan2333/UniBarrage/releases/download/v1.1.0/UniBarrage-linux-amd64.tar.gz")
source_aarch64=("UniBarrage-linux-arm64.tar.gz::https://github.com/xifan2333/UniBarrage/releases/download/v1.1.0/UniBarrage-linux-arm64.tar.gz")
sha256sums_x86_64=('24e9c23915ffb5d1980202622e261a124211a74cc1a20423d299b537f280400f')
sha256sums_aarch64=('f622b308bab0d708030020d486479bd47a610101daab5a918a3309abed8e5dba')

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
