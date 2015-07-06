# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=adif2cabrillo
_pkgname=a2c
pkgver=1.0.2
pkgrel=1
pkgdesc="Ham Radio - QSO log-file converter"
arch=('i686' 'x86_64')
url="http://users.telenet.be/on4qz/a2c/index.html"
license=('GPL3')
depends=('qt5-base' 'desktop-file-utils')
makedepends=('qtchooser')
install=$pkgname.install
source=(http://users.telenet.be/on4qz/${_pkgname}/downloads/${pkgname}_${pkgver}.tar.gz
#	$pkgname
	$pkgname.desktop)

prepare() {
	cd $srcdir/$pkgname

	sed -i s:QSSTV:ADIF2CABRILLO: mainwindow.cpp
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
md5sums=('399da9cc9c807e376c3803168e1d3f16'
         '4a27d24658775a0aa2cbd91ea8e54355')
sha256sums=('7bf27bf16f7a0fcc24f4b25eef5dfaf862ce2933a76e83652fbe6c2bf1a53f22'
            '0e9aacd6da7e1c89f30cd72d9b6adc3b4050e018fba153d586bcc70d7f07355d')
