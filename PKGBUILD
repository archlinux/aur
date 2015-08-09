# Maintainer: Markus Weimar <mail@markusweimar.de>
# Previous maintainer: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.10
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('any')
url="http://launchpad.net/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(http://launchpad.net/fatrace/trunk/${pkgver}/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('b8b101fa3e2e18bac048a3240a5dbdab')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
