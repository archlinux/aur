# Maintainer: Cel Skeggs <arch@celskeggs.com>
pkgname=libsyscall
pkgver=0.1.0
pkgrel=1
pkgdesc="A library providing all of the assembly code needed for a C standard library"
arch=('i686' 'x86_64')
url="https://github.com/celskeggs/libsyscall"
license=('MIT')
source=("https://github.com/celskeggs/libsyscall/archive/v$pkgver.tar.gz")
sha256sums=('3a08f42b3999bd68a87d2f3ce506e9f302dfcfb14444cefcf1e39e731a482604')

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
