# Maintainer:  Birk Birkner <aur at bbirkner.de>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-ooolilypond
_pkgname=OOoLilyPond
pkgver=1.1.9
pkgrel=1
pkgdesc='With OOoLilyPond (OLy) you can use musical notation within OpenOffice.org. Use it for writing a book on music theory or for writing down exercises for music instruments or voice which need to be commented with text.'
arch=('any')
url='https://github.com/OOoLilyPond'
license=('GPL2')
depends=('libreoffice' 'lilypond')
groups=('libreoffice-extensions')
#source=("http://downloads.sourceforge.net/ooolilypond/$_pkgname-$pkgver.oxt")
source=("https://github.com/OOoLilyPond/OOoLilyPond/releases/download/v${pkgver}/${_pkgname}-${pkgver}.oxt")

sha256sums=('87a1d1a483d3a785ed2818c52d71f5f21cf1846a4d48b23d7164d13a564cdf49')
noextract=("$_pkgname-${pkgver}.oxt")
options=("!emptydirs")

package() {
  install -dm755 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  bsdtar -xf $srcdir/$_pkgname-$pkgver.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  chmod 644 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/pkg-desc/pkg-description.txt
}
