# Maintainer: delta48 <dark.magician.48[at]gmail[dot]com>

pkgname=libreoffice-extension-ooolilypond
_pkgname=OOoLilyPond
pkgver=0.4.0
pkgrel=2
pkgdesc='With OOoLilyPond (OLy) you can use musical notation within OpenOffice.org. Use it for writing a book on music theory or for writing down exercises for music instruments or voice which need to be commented with text.'
arch=('any')
url='http://ooolilypond.sourceforge.net'
license=('GPL2')
depends=('libreoffice-fresh') 
groups=('libreoffice-extensions')
source=("http://downloads.sourceforge.net/ooolilypond/$_pkgname-$pkgver.oxt")
md5sums=('3139d345f6325f7a0efa3be8d66bc5bf')
noextract=("$_pkgname-${pkgver}.oxt")
options=("!emptydirs")

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  bsdtar -xf $srcdir/$_pkgname-$pkgver.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  chmod 644 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/pkg-desc/pkg-description.txt
}
