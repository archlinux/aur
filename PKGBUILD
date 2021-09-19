# Maintainer: Mykyta Poturai <mykyta.poturai@tutanota.com>
pkgname=libthemis
pkgver=0.13.12
pkgrel=1
pkgdesc="Open-source high-level cryptographic services library."
url="https://github.com/cossacklabs/themis"
arch=('x86_64')
license=('Apache')
depends=('openssl')
makedepends=('make' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/cossacklabs/themis/archive/refs/tags/$pkgver.tar.gz"
        "makefile-ldconfig.patch")
md5sums=('22e68c9a28f27f008fbadb3ea927abef'
         '5d5db18b2d72d7db21cd7f9d701c2221')

prepare() {
    cd "themis-$pkgver"
    patch -p1 -i "$srcdir/makefile-ldconfig.patch"
}

build() {
    cd "themis-$pkgver"
    make
}

package() {
    cd "themis-$pkgver"
    make install PREFIX="$pkgdir/usr/"
}
