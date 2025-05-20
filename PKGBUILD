# Maintainer:  Berrit Birkner <aur at bbirkner.de>
# Contributor: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=libreoffice-extension-ooolilypond
_pkgname=OOoLilyPond
pkgver=1.1.10
pkgrel=2
pkgdesc='With OOoLilyPond (OLy) you can use musical notation within OpenOffice.org. Use it for writing a book on music theory or for writing down exercises for music instruments or voice which need to be commented with text.'
arch=('any')
url='https://github.com/OOoLilyPond'
license=('GPL-3.0-only')
depends=('libreoffice' 'lilypond')
groups=('libreoffice-extensions')
#source=("http://downloads.sourceforge.net/ooolilypond/$_pkgname-$pkgver.oxt")
source=("https://github.com/OOoLilyPond/OOoLilyPond/releases/download/v${pkgver}/${_pkgname}-${pkgver}.oxt")

sha256sums=('953d1f2a1643100f98e2045525eb2f09a001803cab6a65d71a3660a3b0ad0b14')
noextract=("$_pkgname-${pkgver}.oxt")
options=("!emptydirs")

package() {
  install -vdm755 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  bsdtar -xf $srcdir/$_pkgname-$pkgver.oxt -C $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname
  chmod 644 $pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/pkg-desc/pkg-description.txt
}
