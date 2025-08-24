# Maintainer: Markus Weimar <mail@markusweimar.de>
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
pkgname=fatrace
pkgver=0.19.0
pkgrel=1
pkgdesc='Reports file access events from running processes.'
arch=('x86_64' 'aarch64' 'armv6l')
url='https://github.com/martinpitt/fatrace'
license=('GPL')
depends=('python' 'powertop')
source=("https://github.com/martinpitt/fatrace/archive/${pkgver}.tar.gz")
sha256sums=('78db3ebc6c18207647fb086ba10aed724b934cc32fe8b3b181d0c41386a888d2')

build() {
    cd "$pkgname-$pkgver"
    sed -i "s/usr\/local/usr/ ; s/sbin/bin/" Makefile
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
