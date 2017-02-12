# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=unixcw
pkgver=3.5.0
pkgrel=1
pkgdesc="CW tutor & generator - program suite"
arch=('i686' 'x86_64')
url="http://unixcw.sourceforge.net"
license=('GPL')
depends=('qt5-base')
source=(http://downloads.sourceforge.net/sourceforge/unixcw/$pkgname-$pkgver.tar.gz
        $pkgname
	$pkgname.desktop
	$pkgname.png)

build() {
	cd $srcdir/$pkgname-$pkgver
			 
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make prefix=$pkgdir/usr install
						   											 
	cd $pkgdir/usr/share/man/man1
	ln -sf xcwcp.1.gz unixcw.1.gz
															   
	cd $srcdir
	install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
	install -D -m644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}                                                  
md5sums=('b33cf1be4e1d6c8144eab978f9346f36'
         '3f6168a6c81c550dc78006202f959db3'
         'b07f06b4fc940ba1b853e2b23f686490'
         'f7f81dcf7a1bba55bf8cde70d59d8ed5')
sha256sums=('82c455b67c6444165ec59f75bc29ad0665b79d70489bd09e3166fd1ccde718e6'
            'f23fdc2c7346abd26b8acc8961eff599f08e6905a6cef2b0e402d86c6a9a1714'
            '69d3905c87200ddfda66275b72e73b8fda0636a0a600f5a6e7d8324caab0eee7'
            'be1d10724873ae84fec6f580792e5ce9fe2dbfc3e75e2bde14f6893391a63ff1')
