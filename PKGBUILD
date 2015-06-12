# Maintainer: LaraCraft304 <lara@craft.net.br>

pkgname=xxd
pkgver=1.10
pkgrel=4
pkgdesc="Hexadecimal dump and undump utility"
arch=('i686' 'x86_64' 'armv6h')
url="http://grail.cba.csuohio.edu/~somos/"
license=('custom')
source=("http://grail.cba.csuohio.edu/~somos/$pkgname-$pkgver.tar.gz"
        'LICENSE')
md5sums=('604cf64093fddc30adf41f1f371c9032'
         '292c31826ef1ef3f6ba7ecdd0a891a73')
conflicts=('vim' 'gvim')
depends=('gcc-libs')
options=('zipman')

build() {
	cd "$srcdir/$pkgname-$pkgver/"

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"

	install -Dm644 xxd.1 "$pkgdir"/usr/share/man/man1/xxd.1
	install -Dm755 xxd "$pkgdir"/usr/bin/xxd
        install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/xxd/LICENSE
}
