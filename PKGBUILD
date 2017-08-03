# Maintainer: Web Dawg <webdawg at hackspherelabs.com>
# Contributor: Claudio Riva <firetux83@gmail.com>

pkgname=quicksynergy
pkgver=0.9.0
pkgrel=4
pkgdesc="A graphical interface (GUI) for easily configuring Synergy2"
url="http://quicksynergy.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('synergy' 'gtk2')
makedepends=('pkgconfig' 'automake')
#You can uncomment these lines if for some reason sourceforge removes
#quicksynergy or something else happens
#source=(https://files.hackspherelabs.com/manual/$pkgname-$pkgver.tar.gz \
#        quicksynergy.desktop)
#Make sure to comment the same lines below
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
	quicksynergy.desktop)
md5sums=('94733808d65ef0daaa46284b97e55303'
         '6822bdf8a3feec1bba8ec76c6aa6d821')
         
build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}


package() {
  cd $srcdir/$pkgname-$pkgver
  make 
  make DESTDIR=$pkgdir/ install
  install -m644 -D src/logo/qslogo.png $pkgdir/usr/share/pixmaps/${pkgname}.png
  install -m644 -D $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

}
