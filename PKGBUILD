pkgname=httpc
pkgver=1.2.0
pkgrel=1
pkgdesc='A Simple zero-conf http 1.1 server to use instead of the python http.server'
arch=('x86_64')
url='https://github.com/Evilur/httpc'
license=('MIT')
source=("https://github.com/Evilur/httpc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('e147f9800bad2184572362d66439b9085106138fb884696369411067d39f78264e6c1c859f9755c772d73aea98897da5c65644dcfbf26e48c42e171238509910')
sha256sums=('33e420662cd1bf7865ddb97053e275eca525a20f1e52d788dec29e517f2aea17')
makedepends=('make' 'gcc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 bin/httpc "$pkgdir/usr/bin/httpc"
}