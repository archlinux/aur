# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=xmountains
pkgver=2.9
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Fractal Generator for the xwindow system, intergrates with xscreensaver"
url="http://www.epcc.ed.ac.uk/~spb/xmountains/"
license=('custom')
depends=('libx11' )
makedepends=('imake' 'xbitmaps')
source=("http://ftp.de.debian.org/debian/pool/main/x/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('d5e697708bf59cf7d4892666b5b85c35')
build() {
  cd ${srcdir}
  xmkmf
  make 
}
package() {
  cd ${srcdir}
  install -D -m755 $pkgname ${pkgdir}/usr/bin/$pkgname
  install -D -m644 $pkgname.man \
    ${pkgdir}/usr/share/man/man1/$pkgname.1
  install -D -m644 copyright.h \
    ${pkgdir}/usr/share/licenses/$pkgname/copyright.h
}
