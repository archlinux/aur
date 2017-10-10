# Maintainer: Your Name <youremail@domain.com>
pkgname="transmission-daemon-openrc"
_service="transmission"
pkgver="1.0"
pkgrel=1
pkgdesc="OpenRC transmission-daemon init script"
arch=('any')
url="https://github.com/manjaro/packages-openrc"
license=('GPL')
depends=('transmission-cli' 'openrc')
provides=('transmission-openrc')
conflicts=('transmission-openrc')
replaces=('transmission-openrc')
install="$pkgname.install"
changelog=
source=("$pkgname.confd"
        "$pkgname.initd")
md5sums=('339e22502d7f416806cfe98d28f26940'
         'fa5aae549cd57255a052f71de1fcb035')


package() {
    install -dm755 "$pkgdir/etc/init.d/"
    install -dm755 "$pkgdir/etc/conf.d/"
    install -Dm755 "$srcdir/$pkgname.initd" "$pkgdir/etc/init.d/$_service"
    install -Dm644 "$srcdir/$pkgname.confd" "$pkgdir/etc/conf.d/$_service"
}
