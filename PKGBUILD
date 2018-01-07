# Maintainer: Clayton Craft <clayton@craftyguy.net>
pkgname=networkd-dispatcher
pkgver=1.6
pkgrel=1
pkgdesc="A dispatcher daemon for systemd-networkd events"
arch=('any')
url="https://github.com/craftyguy/networkd-dispatcher"
license=('GPL3')
depends=('python' 'python-dbus' 'python-gobject' 'dbus-glib')
optdepends=('wireless_tools: for interacting with wlan interfaces', 'iw: for interacting with wlan interfaces')
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=('etc/conf.d/networkd-dispatcher.conf')
source=("https://github.com/craftyguy/networkd-dispatcher/archive/${pkgver}.tar.gz")
sha512sums=('e4c544bfe216f7b557ed3a98e142e4f1fcf42d90ec79414797fd9f6ed270a188cca23f1f3a4c49a26d79a7593825a76c3564b1a643c1c6c14f298efa5cf5a61c')

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
        mkdir -p "$pkgdir/etc/conf.d"
        install -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.service" "${pkgdir}/usr/lib/systemd/system/networkd-dispatcher.service"
        install -m644 -D "$srcdir/$pkgname-$pkgver/networkd-dispatcher.conf" "${pkgdir}/etc/conf.d/networkd-dispatcher.conf"
        mkdir -p "$pkgdir/etc/networkd-dispatcher/"{off.d,routable.d,dormant.d,no-carrier.d}
}

