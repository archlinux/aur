# Maintainers: EnumDev <enumdev@enumerated.dev>

pkgname=typer
pkgver=0.1.0
pkgrel=1
pkgdesc='A simple and easy to use text editor written in Go'
arch=('any')
url='https://github.com/EnumeratedDev/Typer'
license=('MIT')

makedepends=('sh' 'which' 'make')
source=("git+https://github.com/EnumeratedDev/Typer.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/Typer"
	make PREFIX=/usr SYSCONFDIR=/etc
}

package() {
	cd "$srcdir/Typer"
	make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
