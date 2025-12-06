# Maintainer: Ian Lester <aur.lester.snowy907silomails.com>
pkgname=schemesh
pkgver=v0.9.2
pkgrel=1
pkgdesc="Fusion between a Unix shell and a Lisp REPL"
arch=('x86_64')
url="https://github.com/cosmos72/schemesh"
license=('GPL-2.0-only')
groups=()
depends=('chez-scheme' 'lz4')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/cosmos72/schemesh')
noextract=()
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname%}"
	git checkout -f "${pkgver}"
}

build() {
	cd "$srcdir/${pkgname%}"
	make prefix=/usr -j
}

package() {
	cd "$srcdir/${pkgname%}"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
