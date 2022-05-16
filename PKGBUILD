# Maintainer: David < david at rjamo dot dev >
pkgname=tracecompass
pkgver=7.3.0
pkgrel=1
pkgdesc="Eclipse Trace Compass is an open source application to solve performance and reliability issues by reading and analyzing traces and logs of a system"
_bld="20220318-1549"
_pkgname_full=trace-compass
arch=('x86_64')
url="https://www.eclipse.org/tracecompass/"
depends=('java-environment>=11')
license=('EPL')
sha512sums=('8759d084ce91befbef0e28e34f0070c57cca781077477f84f84292f05380ac8cef45b52812505dfe325418c2270a5e8ccf7fd4e79027deaf63ea0cf1c2f2bb89'
            'e41300da10039c53c1bf8d6bb59af18161a924e9fd0ae2d1e5da60921d6ee0107a8cdbb2e00c0b80950a2e0876a34ee832c2e9b7b659d365d4575adfa47f010d'
            '467081161c839ff938ee0aac14b663e6d85cdd7431d3560e49babc14b7a779ff619692cefc991265abbb259652d2e112c1fd4d4f44765530d2f18f08387ab9c1')
source=("http://mirror.ibcp.fr/pub/eclipse/tracecompass/releases/${pkgver}/rcp/${_pkgname_full}-${pkgver}-${_bld}-linux.gtk.x86_64.tar.gz"
	"tracecompass.desktop"
	"tracecompass.png")

package() {
	tar -xzf ${_pkgname_full}-${pkgver}-${_bld}-linux.gtk.x86_64.tar.gz
	mkdir -p "$pkgdir/opt"
	mv ./trace-compass "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/trace-compass/tracecompass "$pkgdir/usr/bin/tracecompass"
	install -Dm644 tracecompass.desktop "$pkgdir/usr/share/applications/tracecompass.desktop"
	install -Dm644 tracecompass.png "$pkgdir/usr/share/pixmaps/tracecompass.png"
}
