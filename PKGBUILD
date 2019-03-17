# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=dotproxy-bin
pkgver=28983115cee0804c9a3fa232881b77d6aa71278e
pkgrel=1
provides=('dotproxy')
arch=('armv7h' 'x86_64')
pkgdesc="High-performance DNS-over-TLS proxy"
url="https://github.com/LINKIWI/dotproxy"
source_x86_64=("https://dotproxy.static.kevinlin.info/releases/latest/dotproxy-linux-amd64" "dotproxy.service")
source_armv7h=("https://dotproxy.static.kevinlin.info/releases/latest/dotproxy-linux-arm" "dotproxy.service")
sha256sums_armv7h=('2ec9d66e33397dca25a3f23f6fa929b237cd90c5baf81327172df8475c24e008'
                   '83d579fa90eeac737dd55c7b37274344d06350027236dab726a5fa4415b23c43')
sha256sums_x86_64=('c04cbd799c90e7e37d574ea42057b076ef73d0c3711e7349820fc9dd3dbf125c'
                   '83d579fa90eeac737dd55c7b37274344d06350027236dab726a5fa4415b23c43')


case $CARCH in
	x86_64) 
	dotproxy='dotproxy-linux-amd64'
	;;
	armv7h)
	dotproxy='dotproxy-linux-arm'
	;;
	*)
	;;
esac

package() {
    install -D -m 755 "${dotproxy}" "${pkgdir}/usr/bin/dotproxy"
    install -D -m644 "${srcdir}/dotproxy.service" "${pkgdir}/usr/lib/systemd/system/dotproxy.service"
}
