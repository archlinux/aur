# Maintainer: xifan <xifan2333@gmail.com>
pkgname=dmnotifier-bin
_pkgname=dmnotifier
pkgver=1.5.0
pkgrel=1
pkgdesc="Cross-platform live-stream danmaku notifier client based on UniBarrage"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/dmnotifier"
license=('MIT')
depends=('mpv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("dmnotifier-linux-amd64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.5.0/dmnotifier-linux-amd64")
source_aarch64=("dmnotifier-linux-arm64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.5.0/dmnotifier-linux-arm64")
sha256sums_x86_64=('00f2cf82804fcbb48544c2da5b57ed3f554ee52aa4af22d8d725d3156258625b')
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
