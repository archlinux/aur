# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=adif2cabrillo
_pkgname=a2c
pkgver=1.0.5
pkgrel=2
pkgdesc="Ham Radio - QSO log-file converter"
arch=('i686' 'x86_64')
url="http://users.telenet.be/on4qz/a2c/index.html"
license=('GPL3')
depends=('qt5-base' 'hamradio-menus')
source=(http://users.telenet.be/on4qz/${_pkgname}/downloads/${pkgname}_${pkgver}.tar.gz
	$pkgname.desktop)

prepare() {
	cd $srcdir/$pkgname

	qmake
}

build() {
	cd $srcdir/$pkgname

	make
}
       
package() {
	cd $srcdir/$pkgname

#	make DISTDIR=$pkgdir install
  
	install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname

	install -Dm644 ../*.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 icons/*.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('e236ede34ea7f5b7f92b97837ce3015a'
         '4a27d24658775a0aa2cbd91ea8e54355')
sha256sums=('c798d4c49e96b26bcf3c49831033b1de95410da3779b24c3cce71194fee90dd1'
            '0e9aacd6da7e1c89f30cd72d9b6adc3b4050e018fba153d586bcc70d7f07355d')
