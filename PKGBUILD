# Maintainer: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-ooolilypond
_pkgname=OOoLilyPond
pkgver=0.5.4
pkgrel=1
pkgdesc='With OOoLilyPond (OLy) you can use musical notation within OpenOffice.org. Use it for writing a book on music theory or for writing down exercises for music instruments or voice which need to be commented with text.'
arch=('any')
url='http://github.com/openlilylib/LO-ly'
license=('GPL2')
#depends=('libreoffice-fresh')
groups=('libreoffice-extensions')
#source=("http://downloads.sourceforge.net/ooolilypond/$_pkgname-$pkgver.oxt")
source=("https://github.com/openlilylib/LO-ly/releases/download/$pkgver/$_pkgname-$pkgver.oxt")

md5sums=('de99f4b59deb0403004899c692743ef7')
noextract=("$_pkgname-${pkgver}.oxt")
options=("!emptydirs")

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  bsdtar -xf $srcdir/$_pkgname-$pkgver.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  chmod 644 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/pkg-desc/pkg-description.txt
}
