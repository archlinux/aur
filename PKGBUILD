# Maintainer: Linus Karlsson <arch@linuskarlsson.se>
pkgname=filecryptify
pkgver=1.0.3
pkgrel=2
epoch=
pkgdesc="Simple symmetric file encrypting utility based on libsodium."
arch=('x86_64')
url="https://github.com/zozs/filecryptify"
license=('ISC')
depends=(libsodium)
makedepends=(bmake)
source=("https://github.com/zozs/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0248ebb51c791f4285940f29f433a43ac3777771300a5c6ec7b4544e40d0dd5e')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	bmake VERSION="$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	bmake DESTDIR="$pkgdir" PREFIX="/usr" MANDIR="share/man" VERSION="$pkgver" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
