# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=jsession
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple X session manager"
arch=(any)
url=http://ikn.org.uk/jsession
license=(BSD)
depends=(bash grep dbus run-parts)
backup=(etc/jsession/conf etc/jsession/init)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=(97eec895dd25a46055723ff4d7d2bf86065b74b3)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    touch "$pkgdir/etc/jsession/init"
    install -D LICENSE "$pkgdir"/usr/share/licenses/jsession/LICENSE
}
