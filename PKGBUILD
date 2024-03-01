#Maintainer: Nooberieno <nooberieno@gmail.com>
pkgname='jura'
pkgver=2.4
pkgrel=2
epoch=2
pkgdesc="A lightweight terminal text editor"
arch=('x86_64')
url="https://github.com/Nooberieno/jura"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
changelog='CHANGELOG.md'
source=("https://github.com/Nooberieno/jura/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm775 ./jura "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}