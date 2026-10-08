# Maintainer: agilob <archlinux@agilob.net>
pkgname=tracecompass-bin
pkgver=12.1.0
pkgrel=1
pkgdesc="Eclipse Trace Compass is an open source application to solve performance and reliability issues by reading and analyzing traces and logs of a system"
_bld=20260909-1515

# https://download.eclipse.org/tracecompass/releases/11.3.0/rcp/trace-compass-11.3.0-20260409-1722-linux.gtk.x86_64.tar.gz

_pkgname_full=trace-compass
arch=('x86_64')
url="https://eclipse.dev/tracecompass/"
depends=('java-environment>=17')
license=('EPL')
sha512sums=('2c2d7495ea74c76df6e58dc94c09dc4a5b77583bdc39fba0a3f83d13176222899e02ff78393137e9d7a156b5698502fefe9ff17810013d4fd9e280191dd5b54d'
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