# Maintainer: Theo Henson <theodorehenson@protonmail.com>
pkgname=rco
pkgver=0.1.4
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tteeoo/rco/archive/${pkgver}.tar.gz")
md5sums=('7f98a7dc5411df89eaa0d37b685db8fd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    mkdir $pkgdir/usr/bin/ -p
    mkdir $pkgdir/usr/share/licenses/rco/ -p
    cp $srcdir/$pkgname-$pkgver/defaults/MIT-LICENSE.txt $pkgdir/usr/share/licenses/rco/
    cp $srcdir/$pkgname-$pkgver/target/release/rco $pkgdir/usr/bin/
}

