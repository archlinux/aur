# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=1.2
pkgrel=1
pkgdesc="A dispatcher daemon for systemd-networkd events"
arch=('i686' 'x86_64')
url="https://github.com/craftyguy/networkd-dispatcher"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject' 'wireless_tools' 'dbus-glib')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/craftyguy/networkd-dispatcher/archive/${pkgver}.tar.gz")
sha256sums=('de0cba9e51ae1614e0690a1483b77ca14257c62d771e08394f7df98dd5b8e04a')
prepare() {
        cd "$pkgname-$pkgver"
}

build() {
        cd "$pkgname-$pkgver"
}

check() {
        cd "$pkgname-$pkgver"
}

package() {
        cd "$pkgname-$pkgver"
        mkdir -p "$pkgdir/usr/bin"
        install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/networkd-dispatcher.service"
        mkdir -p "$pkgdir/etc/networkd-dispatcher/"{off.d,routable.d,dormant.d,no-carrier.d}
}

