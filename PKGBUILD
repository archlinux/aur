# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.16.1
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('x86_64' 'aarch64' 'armv6l')
url="https://github.com/martinpitt/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz)
sha256sums=('eda65fe8fcaddb601ffe38d9584654cc014ff16200c11ea8dacae3de0be8935d')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
