# Maintainer: Charles Dong <chardon_cs@proton.me>
pkgname=kurumi
pkgver=0.1.0
pkgrel=1
pkgdesc="Experimental PDF viewer"
arch=("x86_64")
url="https://github.com/chardoncs/kurumi"
license=('MIT' 'Apache-2.0')
groups=()
depends=('gtk4' 'poppler-glib')
makedepends=('cargo' 'rust' 'rustfmt')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=()
sha256sums=()

prepare() {
	mkdir -p $srcdir/${pkgver}-$pkgrel
}

build() {
	cargo install $pkgname@$pkgver --locked --root $srcdir/${pkgver}-$pkgrel --target "$CARCH-unknown-linux-gnu"
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -m 755 $srcdir/${pkgver}-${pkgrel}/bin/$pkgname $pkgdir/usr/bin/
}
