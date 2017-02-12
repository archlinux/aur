# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=1.1
pkgrel=1
pkgdesc="A dispatcher daemon for systemd-networkd events"
arch=('i686' 'x86_64')
url="https://github.com/craftyguy/networkd-dispatcher"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject' 'wireless_tools' 'dbus-glib')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/craftyguy/networkd-dispatcher/archive/${pkgver}.tar.gz")
sha1sums=('a32f43a2785901ae6b5484a986dad9f7997979e6')
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

