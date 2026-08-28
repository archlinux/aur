# Maintainer: xifan <xifan2333@gmail.com>
pkgname=dmnotifier-bin
_pkgname=dmnotifier
pkgver=1.3.0
pkgrel=1
pkgdesc="Cross-platform live-stream danmaku notifier client based on UniBarrage"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/dmnotifier"
license=('MIT')
depends=('mpv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("dmnotifier-linux-amd64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.3.0/dmnotifier-linux-amd64")
source_aarch64=("dmnotifier-linux-arm64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.3.0/dmnotifier-linux-arm64")
sha256sums_x86_64=('af223f7e779e9c6bc541cfef107c17a29fa127746989452b45be849056aef508')
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
