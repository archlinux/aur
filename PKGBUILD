pkgname=lwjgl
pkgver=2.8.0
pkgrel=1
pkgdesc="The Lightweight Java Game Library. Binary install."
arch=(i686 x86_64)
url="http://lwjgl.org"
license=('BSD')
source=(http://downloads.sourceforge.net/project/java-game-lib/Official%20Releases/LWJGL%20$pkgver/$pkgname-$pkgver.zip)
depends=('java-runtime>=6' 'openal')
makedepends=('unzip')
md5sums=('9e701c32a5301f61468a7a41574edaec')

build() {
	cd $srcdir/$pkgname-$pkgver
	#unzip -q $pkgname-$pkgver.zip
	#cd $pkgname-$pkgver
	install -d $pkgdir/usr/lib/ $pkgdir/usr/share/java/
	
	[ "${CARCH}" = "x86_64" ] && cp native/linux/liblwjgl64.so native/linux/libjinput-linux64.so $pkgdir/usr/lib/
	[ "${CARCH}" = "i686" ] && cp native/linux/liblwjgl.so native/linux/libjinput-linux.so $pkgdir/usr/share/java/
	cp jar/* $pkgdir/usr/share/java/
}

