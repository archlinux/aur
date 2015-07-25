# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Based on the awesome WarheadsSE PKGBUILD: https://github.com/WarheadsSE/PKGs/blob/master/gadget-deadbeef/
#contributor: Jason Plum <jplum@archlinuarm.org>
pkgname=gadget-deadbeef-dhcp
_pkgname=gadget-deadbeef # The original package
pkgver=0.1
pkgrel=1
pkgdesc="Allow connection through USB - DHCP setup"
arch=('any')
url=https://github.com/WarheadsSE/PKGs/blob/master/gadget-deadbeef/
license=('GPL2')
source=("$pkgname.modprobe"
        "$pkgname.modules-load"
        "$pkgname.network")
md5sums=('1acbeac837c7867a5c692dd92d8db6f9'
         '83571ae0c87ab32ce5bdccfb065f54b8'
         '1842d0f96bc55fcdabd9b4f33a2bf5b5')
install=${pkgname}.install

# It conflicts with the original package
provide=($_pkgname)
conflicts=($_pkgname)

package() {
    install -Dm644 ${srcdir}/${pkgname}.modules-load \
        ${pkgdir}/etc/modules-load.d/${_pkgname}.conf
    install -Dm644 ${srcdir}/${pkgname}.modprobe \
        ${pkgdir}/etc/modprobe.d/${_pkgname}.conf
    install -Dm644 ${srcdir}/${pkgname}.network \
        ${pkgdir}/etc/systemd/network/${_pkgname}.network
}
