# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=hunspell-nb
_LOver=6.1.3
pkgver=6.1.3.2
pkgrel=1
pkgdesc='Spell checking support for Norwegian'
arch=('any')
url='http://no.speling.org/'
license=('GPL')
depends=('hunspell')
source=("https://download.documentfoundation.org/libreoffice/src/${_LOver}/libreoffice-dictionaries-${pkgver}.tar.xz")
md5sums=('716e3e91be00cee5f1c4fac15d94a867')

package() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/no/"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 nb_NO.aff $pkgdir/usr/share/hunspell
  install -m644 nb_NO.dic $pkgdir/usr/share/hunspell

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/nb_NO.aff ${pkgdir}/usr/share/myspell/dicts/
  ln -sv /usr/share/hunspell/nb_NO.dic ${pkgdir}/usr/share/myspell/dicts/
}

