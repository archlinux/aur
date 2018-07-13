# Maintainer: Linus Karlsson <arch@linuskarlsson.se>
pkgname=filecryptify
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="Simple symmetric file encrypting utility based on libsodium."
arch=('x86_64')
url="https://github.com/zozs/filecryptify"
license=('ISC')
depends=(libsodium)
source=("https://github.com/zozs/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('943459784221932208f60aadadb57eff265b456439bce05c894ec97c4d459228')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
