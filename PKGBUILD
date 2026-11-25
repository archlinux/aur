# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.20.0
pkgrel=1
pkgdesc='Reports file access events from running processes.'
arch=('x86_64' 'aarch64' 'armv6l')
url='https://github.com/martinpitt/fatrace'
license=('GPL')
depends=('python' 'powertop')
source=("https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz")
sha256sums=('242d17dbb7695b1011d97bd856f0756043e6ad73470d38aa0ae69a1df7a490eb')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
