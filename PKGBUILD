# Maintainer: Stilk <alexader612@gmail.com> 

pkgname=hunspell-nb
_LOver=24.2.2
pkgver=24.2.2.2
pkgrel=1
pkgdesc='Spell checking support for Norwegian'
arch=('any')
url='https://www.documentfoundation.org'
license=('GPL')
depends=('hunspell')
source=("https://download.documentfoundation.org/libreoffice/src/${_LOver}/libreoffice-dictionaries-${pkgver}.tar.xz")
md5sums=('7091a370829bdcddd30e73b877bbc404')

package() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/no/"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 nb_NO.aff $pkgdir/usr/share/hunspell
  install -m644 nb_NO.dic $pkgdir/usr/share/hunspell

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/nb_NO.aff ${pkgdir}/usr/share/myspell/dicts/
  ln -sv /usr/share/hunspell/nb_NO.dic ${pkgdir}/usr/share/myspell/dicts/
}

