# Maintainer: Timothy Brown <sysop@timb.us>
pkgname=spell
pkgver=1.1
pkgrel=1
pkgdesc="A clone of the standard Unix program of the same name, implemented as a wrapper for Ispell"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://directory.fsf.org/wiki/Spell"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/spell/$pkgname-$pkgver.tar.gz")
md5sums=('c1dc2c4fd30b28d6480279b79a6fb889')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=$pkgdir/usr
	make
}

package() {
    depends=('ispell')
	cd "$pkgname-$pkgver"
	/usr/bin/install -d $pkgdir/usr/bin $pkgdir/usr/share/info
	/usr/bin/install ./spell $pkgdir/usr/bin/spell
	/usr/bin/install -m 644 ./spell.info $pkgdir/usr/share/info/spell.info
}
