pkgname=nosync
pkgver=1.1
pkgrel=1
pkgdesc="Preload library for disabling file's content synchronization"
arch=('i686' 'x86_64')
url="https://github.com/kjn/$pkgname"
license=('Apache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('6b49297ef2f953bbcc8c8ce71b57e609')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install

	install -Dp -m644 AUTHORS   "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
	install -Dp -m644 NOTICE    "$pkgdir/usr/share/doc/$pkgname/NOTICE"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
