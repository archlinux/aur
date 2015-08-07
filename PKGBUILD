# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-php-vld
_pkgname=vld
_pkgver=VLD_0_13_0
pkgname=php-vld
pkgver=0.13.0
pkgrel=1
pkgdesc="The Vulcan Logic Dumper hooks into the Zend Engine and dumps all the opcodes (execution units) of a script."
arch=('x86' 'x86_64')
url="http://derickrethans.nl/projects.html#vld"
license=('BSD')
makedepends=('php')
source=("https://github.com/derickr/vld/archive/VLD_0_13_0.tar.gz")
sha256sums=('9b8eaac66309d4a869f17e72862baf90af13766ecf30975288a4bb1c944ed57a')

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
