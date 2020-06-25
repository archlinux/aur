# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: petRUShka <petrushkin@yandex.ru>
# Contributor: Laramy Black <laramy2020@gmail.com>
# Contributor: Lorenzo Ferrillo <lorenzofersteam@live.it>
pkgname=diorite
pkgver=4.16.0
pkgrel=2
pkgdesc="A utility and widget library for Nuvola Player project based on GLib, GIO, and GTK"
arch=('x86_64')
url="https://tiliado.eu/diorite"
license=('BSD 2-Clause "Simplified"')
depends=('glib2' 'gtk3' 'libgee' 'sqlite' 'libx11' 'gobject-introspection')
makedepends=('vala-0.42' 'python-pyparsing')
provides=('libdioritegtk4.so-64' 'libdioriteglib4.so-64' 'libdioritedb4.so-64')
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('81c76f4f8816980c0de23a060a41bb4f71861025d550014e60068ac6c2da3c5c')

build() {
	cd "$pkgname-$pkgver"
	./waf distclean configure \
		--prefix=/usr \
		--libdir=/usr/lib \
		--no-vala-lint \
		--novaladoc \
		--no-strict
	./waf build -v -p
}

package() {
	cd "$pkgname-$pkgver"
	./waf install --destdir="$pkgdir"
}
