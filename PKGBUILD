# Maintiner: Victor DENIS <victordenis01@gmail.com>
# Contributor: 
pkgbase=sielo-navigateur
pkgname=sielo-navigateur
pkgver=0.2.2
pkgrel=4
pkgdesc="A fast web browser made in C++14 with Qt5.7"
arch=(x86_64)
url="http://feldrise.com"
license=('custom:MIT')
depends=('qt5-base' 'qt5-webengine' 'qt5-declarative' 'qt5-webchannel' 'qt5-location')
source=(http://feldrise.com/Sielo/Linux/$pkgname-$pkgver.tar.gz)
md5sums=('05874047c0574b26caaca2eda8078f8e')
build() {
	cd $srcdir/$pkgname
	make || return 1
}
package() {
	cd $srcdir/$pkgname
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications/
	mkdir -p $pkgdir/usr/share/pixmaps/
	cp bin/SieloNavigateurV3-WebEngine $pkgdir/usr/bin/
	cp share/applications/Sielo.desktop $pkgdir/usr/share/applications/
	cp share/pixmaps/SNIcon.png $pkgdir/usr/share/pixmaps
	chmod +x $pkgdir/usr/bin/SieloNavigateurV3-WebEngine 
}
