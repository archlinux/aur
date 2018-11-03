# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=hyphen-nb
_LOver=6.1.3
pkgver=6.1.3.2
pkgrel=1
pkgdesc='Norwegian hyphenation rules'
arch=('any')
url='http://no.speling.org/'
depends=('hyphen')
license=('GPL')
source=("https://download.documentfoundation.org/libreoffice/src/${_LOver}/libreoffice-dictionaries-${pkgver}.tar.xz")
md5sums=('716e3e91be00cee5f1c4fac15d94a867')

package() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/no/"
  install -dm755 ${pkgdir}/usr/share/hyphen
  install -m644 hyph_nb_NO.dic $pkgdir/usr/share/hyphen


  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hyphen/hyph_nb_NO.dic ${pkgdir}/usr/share/myspell/dicts/
}

