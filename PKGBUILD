# Maintainer: nekowinston <hey@winston.sh>
# Maintainer: Parmjot Singh <parmjotsinghrobot at gmail dot com>
# Contributor: nekowinston <hey@winston.sh>

pkgname="mpd-rich-presence-bin"
pkgver=0.8.0
pkgrel=1
pkgdesc='Service to display the currently playing song in MPD as your Discord Rich Presence.'
url="https://github.com/nekowinston/mpd-rich-presence"
arch=("x86_64")
license=("MIT")
depends=("mpd")

source=(
	"${pkgname}_${pkgver}_x86_64.tar.gz::$url/releases/download/v${pkgver}/mpd-rich-presence_${pkgver}_linux_amd64.tar.gz"
)

sha256sums=(
	'a590d056a4dbe713995187a699bf2ddec7756970ee1cb954d9fb168d7d198503'
)

package() {
	# bin
	install -Dm755 "./${pkgname%-*}" "${pkgdir}/usr/bin/${pkgname%-*}"
	# license
	install -Dm644 "./LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-*}/LICENSE"
	# service
	install -Dm644 "./${pkgname%-*}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname%-*}.service"
}
