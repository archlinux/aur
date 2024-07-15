# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=artwiz-fonts
pkgver=1.3
pkgrel=11
pkgdesc="This is set of (improved) artwiz fonts"
arch=('any')
url="http://artwizaleczapka.sourceforge.net/"
license=('GPL2')
source=(http://downloads.sourceforge.net/sourceforge/artwizaleczapka/artwiz-aleczapka-en-${pkgver}.tar.bz2
	http://downloads.sourceforge.net/sourceforge/artwizaleczapka/artwiz-aleczapka-de-${pkgver}.tar.bz2
	http://downloads.sourceforge.net/sourceforge/artwizaleczapka/artwiz-aleczapka-se-${pkgver}.tar.bz2)
sha1sums=('81e711b5f00816c57e205c9e60f69237c709679d'
          'ab866d5c248642065c80acfb76c6e3d779c59599'
          '6bc44a55c97963218164dd256212f7f824a0c1df')

package() {
  install -d "${pkgdir}/usr/share/fonts/artwiz-fonts"
  for lang in en de se; do
     install -p -m 0644 artwiz-aleczapka-$lang-${pkgver}/*.pcf "${pkgdir}/usr/share/fonts/artwiz-fonts"
     cat artwiz-aleczapka-$lang-${pkgver}/fonts.alias >> "${pkgdir}/usr/share/fonts/artwiz-fonts/fonts.alias"
  done
}
