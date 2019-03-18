# Maintainer: Your Name <you@example.com>
# Contributor: Tom Richards
_pkgname=vld
_pkgver=VLD_0_14_0
pkgname=php-vld
pkgver=0.14.0
pkgrel=2
pkgdesc="The Vulcan Logic Dumper hooks into the Zend Engine and dumps all the opcodes (execution units) of a script."
arch=('x86_64')
url="http://derickrethans.nl/projects.html#vld"
license=('BSD')
makedepends=('php')
source=("https://github.com/derickr/vld/archive/VLD_0_14_0.tar.gz")
sha256sums=('94b71b29164b31f8dc2e98193a05eaa2fceb41c11823fdf8710cfdf244df4873')

build() {
    cd "$_pkgname-$_pkgver"
    phpize
    ./configure
    make
}

package() {
    cd "$_pkgname-$_pkgver"

    # PHP module
    install -Dm755 modules/vld.so "$pkgdir/usr/lib/php/modules/vld.so"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
