# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.19.1
pkgrel=1
pkgdesc='Reports file access events from running processes.'
arch=('x86_64' 'aarch64' 'armv6l')
url='https://github.com/martinpitt/fatrace'
license=('GPL')
depends=('python' 'powertop')
source=("https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz")
sha256sums=('fd8f143f4e162d36c8ae29c51b32d315415447829c81091e3bb86b326051c77c')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
