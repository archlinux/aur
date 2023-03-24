# Maintainer: éclairevoyant

pkgname=trash
pkgver=1.5.2
pkgrel=1
pkgdesc="CLI trash can (recycle bin)"
arch=(i686 x86_64)
url="https://github.com/tonymorello/$pkgname"
license=('custom:unlicense')
depends=(glibc)
makedepends=(shc)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=(SKIP)

build() {
	make -C $pkgname-$pkgver
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
