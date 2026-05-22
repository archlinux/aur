# Maintainer: xifan <xifan2333@gmail.com>
pkgname=dmnotifier-bin
_pkgname=dmnotifier
pkgver=1.0.9
pkgrel=1
pkgdesc="Cross-platform live-stream danmaku notifier client based on UniBarrage"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/dmnotifier"
license=('MIT')
depends=('mpv')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("dmnotifier-linux-amd64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.0.9/dmnotifier-linux-amd64")
source_aarch64=("dmnotifier-linux-arm64-${pkgver}::https://github.com/xifan2333/dmnotifier/releases/download/v1.0.9/dmnotifier-linux-arm64")
sha256sums_x86_64=('7ec4a54478e00b1a41bb7444c0c8317b4dd3a40529470880ca66e6d9c6fca58f')
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
