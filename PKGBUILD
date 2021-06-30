# Maintainer: David < david at rjamo dot dev >
pkgname=tracecompass
pkgver=7.0.0
pkgrel=1
pkgdesc="Eclipse Trace Compass is an open source application to solve performance and reliability issues by reading and analyzing traces and logs of a system"
_bld="20210609-2151"
_pkgname_full=trace-compass
arch=('x86_64')
url="https://www.eclipse.org/tracecompass/"
depends=('java-environment>=11')
license=('EPL')
sha512sums=('1caf00b2790ad521c17c8765ae6fb0cb8163399cdbf2a7daeeb281d79e9835487d263a09a4bd16e912bf74595352c309d73a5893bf8c134cffa3503423d1d9c0'
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
