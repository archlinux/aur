# Maintainer: Daniel Menelkir <menelkir at itroll dot org>
pkgname=g15stats-openrc
pkgver=20210210
pkgrel=1
pkgdesc="g15stats init script for OpenRC"
arch=('any')
url="https://gitlab.com/menelkir/g15stats"
license=('GPL2')
depends=('g15stats' 'openrc')
_filename=('g15stats.initd' 'g15stats.confd')
source=("https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.initd
	https://gitlab.com/menelkir/g15stats/-/raw/master/contrib/init/g15stats.confd
	")
sha256sums=('e155c92fc3639a2785df1020053cf2881eb53490402dbe8053761302641c7ed2
	57d18f10ededd1003c59e86c2a1721165a0aa6c731bc8880710bb2e8e182bd52	
	')

pkgver() {
   date +%Y%m%d
}

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -dm755 "$pkgdir/etc/conf.d"
    install -Dm755 "$srcdir/$_service.initd" "$pkgdir/etc/init.d/$_service"
    install -Dm644 "$srcdir/$_service.confd" "$pkgdir/etc/conf.d/$_service"
}
