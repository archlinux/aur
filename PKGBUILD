# Maintainer: Anixne <mobilecoderdev@gmail.com>
pkgname='anifetch'
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple OS information fetcher"
arch=('x86_64')
url="https://github.com/anixne/anifetch"
license=('GPL')
depends=('glibc' 'glib2')
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/anixne/anifetch.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/main "$pkgdir/usr/bin/anifetch"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
