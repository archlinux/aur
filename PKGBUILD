# Maintainer: agilob <archlinux@agilob.net>
pkgname=tracecompass-bin
pkgver=11.0.0
pkgrel=1
pkgdesc="Eclipse Trace Compass is an open source application to solve performance and reliability issues by reading and analyzing traces and logs of a system"
_bld="20250613-0813"

# /11.0.0/rcp/trace-compass-11.0.0--linux.gtk.x86_64.tar.gz

_pkgname_full=trace-compass
arch=('x86_64')
url="https://eclipse.dev/tracecompass/"
depends=('java-environment>=17')
license=('EPL')
sha512sums=('d540d4b90ce5b63557a07b6921eb1997e910d038b7994ccd67b49b9540d91a84b56257d2527018743945a2f6ddcfea0ab814050e652ec9f923e8400a6f453ccf'
            'e41300da10039c53c1bf8d6bb59af18161a924e9fd0ae2d1e5da60921d6ee0107a8cdbb2e00c0b80950a2e0876a34ee832c2e9b7b659d365d4575adfa47f010d'
            '467081161c839ff938ee0aac14b663e6d85cdd7431d3560e49babc14b7a779ff619692cefc991265abbb259652d2e112c1fd4d4f44765530d2f18f08387ab9c1')
source=("https://download.eclipse.org/tracecompass/releases/${pkgver}/rcp/${_pkgname_full}-${pkgver}-${_bld}-linux.gtk.x86_64.tar.gz"
	"tracecompass.desktop"
	"tracecompass.png")

package() {
	mkdir -p "$pkgdir/opt"
	mv ./trace-compass "$pkgdir/opt/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/trace-compass/tracecompass "$pkgdir/usr/bin/tracecompass"
	install -Dm644 tracecompass.desktop "$pkgdir/usr/share/applications/tracecompass.desktop"
	install -Dm644 tracecompass.png "$pkgdir/usr/share/pixmaps/tracecompass.png"
}
