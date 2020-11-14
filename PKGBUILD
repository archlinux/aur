# Maintainer: Fabian Bornschein <plusfabi-cat-gmail-dog-com>

pkgname=blacklist-hw-watchdog
pkgdesc="blacklist following kernel module: iTCO_wdt, sp5100-tco"
install="archlinux.install"
pkgver=1
pkgrel=1
url="https://aur.archlinux.org/packages/blacklist-hw-watchdog"
arch=('any')
license=('GPL3')
source=('98-blacklist-hw-watchdog.hook'
	'blacklist-hw-watchdog.conf')
sha512sums=('3e77984545ce4568a984e76fc5770af623eeac99655b0ee5bd4b1e33f8f5d95af8d12256e0482cf167cfb4e0710b7c3e170c6eb45a8641a8802c215fcd454bac'
            '9ccabc32e6ab45c32400df3b5ad359dc91c44e50270b7b80fb486ed2c52b92a51624b9795fc97255994d09b2e8f1783abfc4b7613395805632c3a01d3d9a77f6')

package()
{
    cd "${srcdir}"

    install -D -m644 "${srcdir}/blacklist-hw-watchdog.conf" \
        "${pkgdir}/usr/lib/modprobe.d/blacklist-hw-watchdog.conf"

    install -D -m644 "${srcdir}/98-blacklist-hw-watchdog.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/98-blacklist-hw-watchdog.hook"
}
