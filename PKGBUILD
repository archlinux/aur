# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.12
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('i686' 'x86_64')
url="http://launchpad.net/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(http://launchpad.net/fatrace/trunk/${pkgver}/+download/$pkgname-$pkgver.tar.bz2)
sha256sums=('50e71706f2cad4efc37c23bd292a2d3aa53dd883506e910267b2eeb5b241f66b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
