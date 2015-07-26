# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Based on the awesome WarheadsSE PKGBUILD: https://github.com/WarheadsSE/PKGs/blob/master/gadget-deadbeef/
#contributor: Jason Plum <jplum@archlinuarm.org>
pkgname=gadget-deadbeef-legacy-dhcp
_pkgname=gadget-deadbeef # The original package
pkgver=0.1
pkgrel=1
pkgdesc="Allow connection through USB (via 'legacy' module 'g_ether') - DHCP setup"
arch=('any')
url=https://github.com/WarheadsSE/PKGs/blob/master/gadget-deadbeef/
license=('GPL2')
source=("$pkgname.modules-load"
        "$pkgname.network")
md5sums=('690fbeec1f918177a869bd04e358c268'
         '019b112ca41642b14931dc921c67fc88')
install=${pkgname}.install

# It conflicts with the original package
provide=($_pkgname)
conflicts=(
	$_pkgname
	${_pkgname}-dhcp
	)

package() {
    install -Dm644 ${srcdir}/${pkgname}.modules-load \
        ${pkgdir}/etc/modules-load.d/${_pkgname}.conf
    install -Dm644 ${srcdir}/${pkgname}.network \
        ${pkgdir}/etc/systemd/network/${_pkgname}.network
}
