# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=sass
pkgver=1.3.8
pkgrel=2
license=("MIT")
pkgdesc='A featureful z80 assembler'
depends=("mono")
arch=("x86_64")
url='https://github.com/KnightOS/sass'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/sass/archive/${pkgver}.tar.gz")
sha256sums=('dd36c15c74f425d855632996afbc124c26a507fd183df42d7dfecd7b4f0221c2')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir/usr" PREFIX="/usr"
}
