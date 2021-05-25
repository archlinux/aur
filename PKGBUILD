# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.16.3
pkgrel=1
pkgdesc="Reports file access events from all running processes."
arch=('x86_64' 'aarch64' 'armv6l')
url="https://github.com/martinpitt/fatrace"
license=('GPL')
depends=('python' 'powertop')
source=(https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz)
sha256sums=('e0812d425255779841388377c7a112187a6dfce8f4c32df0d9afc38855ade9e1')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
