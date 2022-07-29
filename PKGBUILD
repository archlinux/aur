# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=ddns
pkgname=newfuture-ddns-bin
pkgver=2.11.5
pkgrel=1
pkgdesc="Automatically update domain name resolution to local IP."
url="https://github.com/NewFuture/DDNS"
license=('MIT')
arch=('x86_64')
conflicts=("${_pkgbase}" "python-ddns" "newfuture-ddns")
depends=('glibc')
provide=('ddns' 'newfuture-ddns')
options=('!strip')
noextract=("${_pkgbase}")
source=(
"https://github.com/NewFuture/DDNS/releases/download/v${pkgver}/${_pkgbase}"
"newfuture_ddns.service"
"newfuture_ddns.timer"
"config.json")
sha256sums=(
"c9728a86046de0869093a96cda6257cb6799867d34afe7c772a30dc7c9412810"
"11a427cc3d3a8a4c5e1bbcaba8c94dd9265a6b4c4f53f16d694d83ff92514078"
"1e084c5349449289129006b21294699ec34122050ada92be81e682631a60f159"
"aab0eb4c02ab5fa20f1b6c2f66542358ee18ebbb0a60ec2c60e6371844c48d73"
)
install="${pkgname}.install"

package() {
    install -Dm644 config.json "${pkgdir}/etc/ddns/config.json";
	install -Dm755 "${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
	install -Dm644 newfuture_ddns.service  "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.service"
	install -Dm644 newfuture_ddns.timer "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.timer";
}
