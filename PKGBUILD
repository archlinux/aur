# Maintainer: xifan <xifan2333@gmail.com>
pkgname=dmnotifier-bin
_pkgname=dmnotifier
pkgver=1.0.8
pkgrel=1
pkgdesc="Cross-platform live-stream danmaku notifier client based on UniBarrage"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/dmnotifier"
license=('MIT')
depends=('mpv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("dmnotifier-linux-amd64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.0.8/dmnotifier-linux-amd64")
source_aarch64=("dmnotifier-linux-arm64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.0.8/dmnotifier-linux-arm64")
sha256sums_x86_64=('6ab50108c0c1c5edfe029423170dc92435138c487f7d560d4f07618ff6d4e06b')
sha256sums_aarch64=('SKIP')

package() {
	cd "${srcdir}"

	local binary
	case "${CARCH}" in
		x86_64) binary="dmnotifier-linux-amd64-${pkgver}" ;;
		aarch64) binary="dmnotifier-linux-arm64-${pkgver}" ;;
	esac

	install -Dm755 "${binary}" "${pkgdir}/usr/bin/${_pkgname}"
}
