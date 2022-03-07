# Maintainer: KUMAX <kumax2048@pm.me>

_pkgbase=ddns
pkgname=newfuture-ddns-bin
pkgver=2.10.3
pkgrel=1
pkgdesc="Automatically update domain name resolution to local IP."
url="https://github.com/NewFuture/DDNS"
license=('MIT')
arch=('x86_64')
conflicts=("${_pkgbase}" "new-future-ddns")
depends=('glibc')
options=('!strip')
noextract=("${_pkgbase}")
source=("https://github.com/NewFuture/DDNS/releases/download/v${pkgver}/${_pkgbase}"
				"newfuture_ddns.service"
				"newfuture_ddns.timer")
md5sums=('a59227a7704a0c06201dd1486e235c9a' 
         'd3d9a73fd7d7766caf1431d34e18f2c2'
				 '6d718f657902ccd5cd32f5271084dbb8')
install="${pkgname}.install"

package() {
	chmod 755 ${_pkgbase}
	install -Dm755 -d "${pkgdir}/etc/ddns"
	install -Dm755 "${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
	install -Dm644 newfuture_ddns.service  "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.service"
	install -Dm644 newfuture_ddns.timer "${pkgdir}/usr/lib/systemd/system/newfuture_ddns.timer";
}
