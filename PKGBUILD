# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.18.0
pkgrel=1
pkgdesc='Reports file access events from running processes.'
arch=('x86_64' 'aarch64' 'armv6l')
url='https://github.com/martinpitt/fatrace'
license=('GPL')
depends=('python' 'powertop')
source=("https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz")
sha256sums=('f2ca2623c7b3744d01827e0301df315e8b428c9a479081469ee6d21d0889de51')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
