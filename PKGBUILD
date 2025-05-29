# Maintainer: Manuel Alcaraz Zambrano <manuelalcarazzam@gmail.com>

pkgname=bbppairings
pkgver=5.0.1
pkgrel=1
pkgdesc='Swiss-system chess tournament pairing engine'
arch=(x86_64)
url='https://github.com/BieremaBoyzProgramming/bbpPairings'
license=('Apache-2.0')
depends=(gcc-libs
         glibc)
makedepends=(git)
source=(git+https://github.com/BieremaBoyzProgramming/bbpPairings.git#tag=v$pkgver
        remove-werror.patch)
sha256sums=('7a89f417925815a98b19737b92847efa6e56a78fe226aa919cac9c43ce79b353'
            '6cf522a44137b780b297ce84fe3327417b9e1272484da02e3c05fc1fe55a50c8')

prepare() {
    cd bbpPairings
    patch -p1 -i "$srcdir/remove-werror.patch"
}

build() {
    cd bbpPairings
    make
}

package() {
    cd bbpPairings
    install -Dm755 bbpPairings.exe "$pkgdir/usr/bin/bbpPairings"
}
