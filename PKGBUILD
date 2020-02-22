# Maintainer: Theo Henson <theodorehenson@protonmail.com>
pkgname=rco
pkgver=0.1.5
pkgrel=1
pkgdesc="A configuration manager written in rust."
arch=('any')
url="https://github.com/tteeoo/rco"
license=('MIT')
depends=(
  'gcc-libs'
  'sudo'
)
makedepends=(
  'cargo'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tteeoo/rco/archive/${pkgver}.tar.gz")
md5sums=('9d3eeb1f6b039b7bb5eed1c313698356')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    mkdir $pkgdir/usr/bin/ -p
    mkdir $pkgdir/usr/share/licenses/rco/ -p
    cp $srcdir/$pkgname-$pkgver/LICENSE-MIT $pkgdir/usr/share/licenses/rco/MIT-LICENSE.txt
    cp $srcdir/$pkgname-$pkgver/target/release/rco $pkgdir/usr/bin/
}

