pkgname=httpc
pkgver=1.1.0
pkgrel=1
pkgdesc='A Simple zero-conf http 1.1 server to use instead of the python http.server'
arch=('x86_64')
url='https://github.com/Evilur/httpc'
license=('MIT')
source=("https://github.com/Evilur/httpc/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6d0a639de03740b7c4c215a4da27c42efa183f2b4ad29cb6aaae63b1934d2955fc17691c663b0828fd57132e5f0e9725c596bdae37267181b52b26d53b829bd4')
sha256sums=('82e7b3242021e7538d6178e29258e2cab39484b814dfe5b79d6a4f099a09d881')
makedepends=('make' 'gcc')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 bin/httpc "$pkgdir/usr/bin/httpc"
}