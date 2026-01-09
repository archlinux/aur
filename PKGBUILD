pkgname=nikki-editor
pkgver=1.0
pkgrel=1
pkgdesc="Simple terminal-based text editor written in C"
arch=('x86_64')
url="https://github.com/nijat19trying/nikki-editor"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
