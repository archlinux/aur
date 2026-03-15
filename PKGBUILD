# Maintainer: agilob <archlinux@agilob.net>
pkgname=tracecompass-bin
pkgver=11.2.0
pkgrel=1
pkgdesc="Eclipse Trace Compass is an open source application to solve performance and reliability issues by reading and analyzing traces and logs of a system"
_bld="20251212-2003"
# https://download.eclipse.org/tracecompass/releases/11.2.0/rcp/trace-compass-11.2.0-20251212-2003-linux.gtk.x86_64.tar.gz
# /11.0.0/rcp/trace-compass-11.0.0--linux.gtk.x86_64.tar.gz

_pkgname_full=trace-compass
arch=('x86_64')
url="https://eclipse.dev/tracecompass/"
depends=('java-environment>=17')
license=('EPL')
sha512sums=('fdf76c2d398a976f710cc7ff7ccc5cf16fe42f45e1f258fa045386db1375225a7786697ed381529b118c886b17a0ce323087f4eed5f39afc908674ec08f33b82'
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