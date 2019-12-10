# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.15
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('x86_64')
url="https://launchpad.net/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(https://launchpad.net/fatrace/trunk/${pkgver}/+download/$pkgname-$pkgver.tar.xz)
sha256sums=('f9447115428c0b88abf05438559c1c4b1a3aec6d69fc09dc469c295249b419ad')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
