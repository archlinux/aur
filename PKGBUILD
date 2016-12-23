# Maintiner: Victor DENIS <victordenis01@gmail.com>
# Contributor: 
pkgbase=sielo-navigateur
pkgname=sielo-navigateur
pkgver=0.4.0
pkgrel=2
pkgdesc="A fast web browser made in C++14 with Qt5.7"
arch=(x86_64)
url="http://feldrise.com"
license=('custom:MIT')
depends=('qt5-base' 'qt5-webengine' 'qt5-declarative' 'qt5-webchannel' 'qt5-location')
source=(http://feldrise.com/Sielo/Linux/$pkgname-v$pkgver.tar.gz)
md5sums=('627633d99b76e3023b6fad6d0656d7b8')
build() {
	cd $srcdir/$pkgname-v$pkgver/build/release
	make || return 1
}
package() {
	cd $srcdir/$pkgname-v$pkgver
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/pixmaps/
	cp build/release/SieloDataSoftware/SieloDataSoftware $pkgdir/usr/bin/
	cp build/release/SNThemeEditor/SNThemeEditor $pkgdir/usr/bin/
	cp build/release/SieloNavigateur/SieloNavigateur $pkgdir/usr/bin/
	cp share/applications/Sielo.desktop $pkgdir/usr/share/applications/
	cp share/pixmaps/SNIcon.png $pkgdir/usr/share/pixmaps
	chmod +x $pkgdir/usr/bin/SieloDataSoftware
	chmod +x $pkgdir/usr/bin/SNThemeEditor
	chmod +x $pkgdir/usr/bin/SieloNavigateur
}
