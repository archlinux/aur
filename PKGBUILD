# Maintainer: xifan <xifan2333@gmail.com>
pkgname=webcastmate-bin
_pkgname=webcastmate
pkgver=0.1.0
pkgrel=1
pkgdesc="Multi-platform live protocol CLI (no browser): login -> go-live RTMP -> live.json"
arch=('x86_64' 'aarch64')
url="https://github.com/xifan2333/webcast-mate"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
source_x86_64=("webcastmate-linux-amd64-${pkgver}::https://github.com/xifan2333/webcast-mate/releases/download/v0.1.0/webcastmate-linux-amd64")
source_aarch64=("webcastmate-linux-arm64-${pkgver}::https://github.com/xifan2333/webcast-mate/releases/download/v0.1.0/webcastmate-linux-arm64")
sha256sums_x86_64=('e70e769677f28e7c81b824dd056b769922b6d259dd174c97446a9aa657058dfa')
sha256sums_aarch64=('SKIP')

package() {
	cd "${srcdir}"

	local binary
	case "${CARCH}" in
		x86_64) binary="webcastmate-linux-amd64-${pkgver}" ;;
		aarch64) binary="webcastmate-linux-arm64-${pkgver}" ;;
	esac

	install -Dm755 "${binary}" "${pkgdir}/usr/bin/${_pkgname}"
}
