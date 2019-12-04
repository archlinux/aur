pkgname='lua-lpeglabel-git'
pkgver=1.6.0
pkgrel=1
pkgdesc='An extension of LPeg that supports labeled failures'
arch=('x86_64' 'armv7h')
url='https://github.com/sqmedeiros/lpeglabel'
license=('MIT')
source=("$pkgname::git+https://github.com/sqmedeiros/lpeglabel")
sha1sums=('SKIP')
depends=('glibc')

build() {
	cd $srcdir/$pkgname
	make -j1
}
package() {
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -Dm644 $srcdir/$pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	mkdir -p $pkgdir/usr/lib/lua/5.3/
	mkdir -p $pkgdir/usr/share/lua/5.3/
	install -m 755 $srcdir/$pkgname/lpeglabel.so $pkgdir/usr/lib/lua/5.3
	install -m 755 $srcdir/$pkgname/relabel.lua $pkgdir/usr/share/lua/5.3
}
