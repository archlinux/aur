#Maintainer: Nooberieno <nooberieno.dev@gmail.com>
pkgname='jura'
pkgver=4.2
pkgrel=4
epoch=4
pkgdesc="A lightweight terminal text editor"
arch=('x86_64')
url="https://github.com/Nooberieno/jura"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc')
changelog='CHANGELOG.md'
source=("https://github.com/Nooberieno/jura/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	gcc jura.c -o jura -std=c99
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm775 ./jura "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 ./CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
	install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}