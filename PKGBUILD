# Maintainer: LaraCraft304 <lara@craft.net.br>

pkgname=xxd
pkgver=1.10
pkgrel=3
pkgdesc="Hexadecimal dump and undump utility"
arch=('i686' 'x86_64')
url="http://grail.cba.csuohio.edu/~somos/"
license=('CUSTOM')
source=(http://grail.cba.csuohio.edu/~somos/$pkgname-$pkgver.tar.gz)
md5sums=('604cf64093fddc30adf41f1f371c9032')
conflicts=('vim' 'gvim')
options=(zipman)

build() {
	cd "$srcdir/$pkgname-$pkgver/"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	install -d "$pkgdir"/usr/share/man/man1/
	install -Dm 644 xxd.1 "$pkgdir"/usr/share/man/man1/
	install -Dm 755 xxd "$pkgdir"/usr/bin/xxd
}
