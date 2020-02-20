# Maintainer: Theo Henson <theodorehenson@protonmail.com>
pkgname=rco
pkgver=0.1.4
pkgrel=3
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tteeoo/rco/archive/${pkgver}.tar.gz")
md5sums=('89d7912351fc8e575d4f54e52625213a')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    mkdir $pkgdir/usr/bin/ -p
    mkdir $pkgdir/usr/share/licenses/rco/ -p
    cp $srcdir/$pkgname-$pkgver/defaults/MIT-LICENSE $pkgdir/usr/share/licenses/rco/MIT-LICENSE.txt
    cp $srcdir/$pkgname-$pkgver/target/release/rco $pkgdir/usr/bin/
}

