# Maintainer: Cel Skeggs <arch@celskeggs.com>
pkgname=libsyscall
pkgver=0.1.2
pkgrel=1
pkgdesc="A library providing all of the assembly code needed for a C standard library"
arch=('i686' 'x86_64')
url="https://github.com/celskeggs/libsyscall"
license=('MIT')
source=("https://github.com/celskeggs/libsyscall/archive/v$pkgver.tar.gz")
sha256sums=('960f1b3b934201a8da5966213e645d5b8d17107dff4ca54df461c4ee25aff5fd')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -d $pkgdir/usr/share/licenses/libsyscall
	install -m 644 LICENSE $pkgdir/usr/share/licenses/libsyscall/LICENSE
}
