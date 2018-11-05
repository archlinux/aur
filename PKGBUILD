# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.13
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('i686' 'x86_64')
url="http://launchpad.net/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(http://launchpad.net/fatrace/trunk/${pkgver}/+download/$pkgname-$pkgver.tar.bz2)
sha256sums=('7d8b0670896b10600c89caedeec52c26237260d5a20fdea7049cd97f57213043')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
