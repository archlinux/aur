# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=hunspell-bg
_LOver=7.6.3
pkgver=7.6.3.1
pkgrel=0
pkgdesc='Bulgarian dictionary for Hunspell'
arch=('any')
url="https://bgoffice.sourceforge.net/"
license=('GPL2')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("https://download.documentfoundation.org/libreoffice/src/${_LOver}/libreoffice-dictionaries-${pkgver}.tar.xz")
md5sums=('45ecbaed999bfab64a274c77e211ea8b')

package() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/bg_BG/"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 bg_BG.aff $pkgdir/usr/share/hunspell
  install -m644 bg_BG.dic $pkgdir/usr/share/hunspell

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/bg_BG.aff ${pkgdir}/usr/share/myspell/dicts/
  ln -sv /usr/share/hunspell/bg_BG.dic ${pkgdir}/usr/share/myspell/dicts/
}
