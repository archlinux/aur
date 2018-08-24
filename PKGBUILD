# Maintainer: Jonas Frei <freijon@gmail.com>

pkgname=memefs
pkgver=0.2.0
pkgrel=1
pkgdesc="A filesystem for your memes"
arch=('x86_64')
url="https://github.com/svenstaro/memefs"
license=('MIT')
depends=('fuse2')
makedepends=('cargo')
source=("memefs-${pkgver}.tar.gz::https://github.com/svenstaro/memefs/archive/${pkgver}.tar.gz")
sha512sums=('c656d63e9e434ed5b12e0451441dfd6b35c691cbac67be80b348433ef418be891fa4136f9d61496494706c242bd242740175f24ca1e636b6cb8ff235b1ee5105')
provides=('memefs')

build() {
	cd $srcdir/$pkgname-$pkgver
	cargo build --release
}

package() {
	install -Dv $srcdir/$pkgname-$pkgver/target/release/memefs $pkgdir/usr/bin/memefs
}
