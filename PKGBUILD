# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=memtool
pkgver=2018.03.0
pkgrel=1
pkgdesc="program that allows access to memory mapped registers"
arch=(x86_64)
url="https://github.com/pengutronix/memtool"
license=('GPL')
source=("https://github.com/pengutronix/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha512sums=('b618cf375157fa34ff3436097f4e3ecf649d5205d44f3bf4f4fa9a13947fb6becb4ed091c7364be015b2bae1b19c6b737ab6ddc7157990f6c703a9255a56edbf')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	autoreconf
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
