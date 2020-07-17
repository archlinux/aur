# Maintainer: Nitroretro <nitroretro@protonmail.com>
# Maintainer: NixUnderflow <nixunderflow@protonmail.com>

pkgname=duckdns-ipv6
_pkgname=duckdns
pkgver=1.1
pkgrel=2
pkgdesc="Automatically update DuckDNS domains, with IPv6 support"
arch=("any")
url="https://${_pkgname}.org"
license=("GPL3")
depends=("curl" "jq" "sh" "util-linux")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}.d/default")
install="${_pkgname}.install"
source=("${_pkgname}.conf"
	"${_pkgname}.sh"
	"${_pkgname}.service"
	"${_pkgname}.timer")
sha512sums=('85424f976426286b4f91b997db0163108f84527663024c05c70f895dcb85a3aa507849e3c3701985957254d88c98b6e9af54dbbc318db677141cf6bb05a2a51c'
            '03469909987fb15bea36208317edac83e675d9452e02222b7cab00dd4f67e7c4b0fdf1027c5d1dbae430de7453bf1d8f033f64942011266b14efc68085e5b652'
            '10783060db994bee4faf03920374840bc57b105304a7aa9b1ebc9161f9a765b985c2ef83906fb6f2c0dbb7b118cde95820e786fd39f78b443af5927e9bb71391'
            '55fa343bd4be6157b9b909721559a8fe163ad0968d2dcfcb5d9bca2fe268d70b1369dde225adc8d3a31815356d43afc76a43d8cf39d92209a1965d0e1e40f618')

package() {
	install -Dm600 "${_pkgname}.conf" "${pkgdir}/etc/${_pkgname}.d/default"
	install -Dm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
	install -Dm644 "${_pkgname}.timer" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.timer"
}
