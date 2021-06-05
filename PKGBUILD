# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-openrc
pkgver=20210605
pkgrel=1
pkgdesc="g15stats init script for OpenRC"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15stats' 'openrc')
_filename=('g15stats.initd' 'g15stats.confd')
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.initd" 
        "https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.confd")
sha256sums=('6d43c777ececbe7a926b57b0bcf948df5ee810b6a676dd59ebc89c667d3d47d0'
            'ca6520f9752ec526e284d4359aea57399949e0ea5e98ee5904524d186d898f01')

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -dm755 "$pkgdir/etc/conf.d"
    install -Dm755 "$srcdir/g15stats.initd" "$pkgdir/etc/init.d/g15stats"
    install -Dm644 "$srcdir/g15stats.confd" "$pkgdir/etc/conf.d/g15stats"
}
