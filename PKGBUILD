# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

pkgname=patricia
pkgver=5
pkgrel=1
pkgdesc='Super aggressive chess engine'
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/Adam-Kulju/Patricia'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('clang' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('a71c61c4034269a82b6b58b87501ae662f40d13a327fcf1fa9360bc63ff7dee926184068dacfeb11de565ebaefe6db131c0300d469d4ee4d9dd600090d024d7f')

build() {
    cd "Patricia-$pkgver/engine"
    make -B
}

package() {
    cd "Patricia-$pkgver/engine"
    install -Dm755 ./patricia "$pkgdir/usr/bin/patricia"
    install -Dm644 ../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ../README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
