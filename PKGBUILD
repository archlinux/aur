# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.16.2
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('x86_64' 'aarch64' 'armv6l')
url="https://github.com/martinpitt/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz)
sha256sums=('300b5ab4aa89f62e556e5e0aaf5cfbec638a7185f428419afa8bd6d23a16a207')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
