# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.17.0
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('x86_64' 'aarch64' 'armv6l')
url="https://github.com/martinpitt/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz)
sha256sums=('38f23014be5c2d5f7d40560931ae8bf24161db311d1795631bfaba02845eed90')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
