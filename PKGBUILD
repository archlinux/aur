# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.11
pkgrel=2
pkgdesc="Reports file access events from all running processes."
arch=('i686' 'x86_64')
url="http://launchpad.net/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(http://launchpad.net/fatrace/trunk/${pkgver}/+download/$pkgname-$pkgver.tar.bz2)
md5sums=('9cfe7364942d900cb99db8e5ed38c3c5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
