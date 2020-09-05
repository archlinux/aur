# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=jsession
pkgver=0.3.1
pkgrel=1
pkgdesc="Simple X session manager"
arch=(any)
url=http://ikn.org.uk/tool/jsession
license=(BSD)
depends=(bash grep dbus run-parts)
backup=(etc/jsession/conf etc/jsession/init)
source=(http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('ebb4e26e1ac7146b2c5c2f313427155debb2bd33')

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
