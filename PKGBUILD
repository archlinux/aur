# Maintainer: ajs124 < aur AT ajs124 DOT de >

pkgname=moagg
pkgver=1.95b
pkgrel=3
pkgdesc="Mother of all gravity games"
arch=('any')
url="http://moagg.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
provides=('moagg')
source=("http://sourceforge.net/projects/moagg/files/moagg2/1.95/moagg-1.95b-bin.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.png")
sha1sums=('cc8f95beed2933b6a9e794854741e6f84a5cb392' 
          'd72552538eb2272d84b3839818da83bdc8934499' 
          '57bc28d7209161d36b70e242f14913898aeaf478' 
          'efb6da987f3a3ff7853f281ada37163e87a4f82c')

package() {
	cd $srcdir/$pkgname-$pkgver
	rm run.bat
	mkdir -p $pkgdir/usr/share/$pkgname/
	cp -r * $pkgdir/usr/share/$pkgname/
	install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 {} +
}
