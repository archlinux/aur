# Maintainer: Bjoern Franke <bjo@nord-west.org>

pkgname=dotproxy-bin
pkgver=a12441f792ac2976c3b4b24c2bd63024e5328d26
pkgrel=1
provides=('dotproxy')
arch=('armv7h' 'x86_64')
pkgdesc="High-performance DNS-over-TLS proxy"
url="https://github.com/LINKIWI/dotproxy"
source_x86_64=("https://dotproxy.static.kevinlin.info/releases/latest/dotproxy-linux-amd64" "dotproxy.service")
source_armv7h=("https://dotproxy.static.kevinlin.info/releases/latest/dotproxy-linux-arm" "dotproxy.service")
sha256sums_armv7h=('956ba4ee49742d08cf8afc17deb8e27de83b8ec07598391d6ea00cf5e51d1df2'
                   '83d579fa90eeac737dd55c7b37274344d06350027236dab726a5fa4415b23c43')
sha256sums_x86_64=('1ed49bcb83bd3798f307d8ba4f5769ccfe3c762acd26032b83cb1ce2d6a5fbe8'
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
