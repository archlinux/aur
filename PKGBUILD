# Maintainer: Theo Henson <theodorehenson@protonmail.com>
pkgname=rco
pkgver=0.1.1
pkgrel=1
pkgdesc="A configuration manager written in rust."
arch=('any')
url="https://github.com/tteeoo/rco"
license=('MIT')
depends=(
  'gcc-libs'
)
makedepends=(
  'cargo'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tteeoo/rco/archive/v${pkgver}.tar.gz")
md5sums=('5b79318506e343fac48f634e4a35d2e4')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    mkdir $pkgdir/usr/bin/ -p
    mkdir $pkgdir/usr/share/licenses/rco/ -p
    cp $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/rco/
    cp $srcdir/$pkgname-$pkgver/target/release/rco $pkgdir/usr/bin/
}

