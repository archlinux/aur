# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=g15stats-openrc
pkgver=20211101
pkgrel=1
pkgdesc="g15stats init script for OpenRC"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15stats' 'g15daemon-openrc')
_filename=('g15stats.initd' 'g15stats.confd')
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.initd"
        "https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.confd")
sha256sums=('136da674e6e7c993dd388e09b245dc43d25fefebb1e379092585cbf87bf55676'
            'ca6520f9752ec526e284d4359aea57399949e0ea5e98ee5904524d186d898f01')

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -dm755 "$pkgdir/etc/conf.d"
    install -Dm755 "$srcdir/g15stats.initd" "$pkgdir/etc/init.d/g15stats"
    install -Dm644 "$srcdir/g15stats.confd" "$pkgdir/etc/conf.d/g15stats"
}
