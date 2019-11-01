# Maintainer: morguldir <morguldir@protonmail.com>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=hunspell-nn
_LOver=6.3.2
pkgver=6.3.2.2
pkgrel=1
pkgdesc='Spell checking support for Norwegian Nynorsk'
arch=('any')
url='http://no.speling.org/'
license=('GPL')
depends=('hunspell')
source=("https://download.documentfoundation.org/libreoffice/src/${_LOver}/libreoffice-dictionaries-${pkgver}.tar.xz"{,.asc})
validpgpkeys=('C2839ECAD9408FBE9531C3E9F434A1EFAFEEAEA3') # LibreOffice Build Team (CODE SIGNING KEY) <build@documentfoundation.org>
sha256sums=('b28e5fd2a3dc05eb871ba9a058bfaa6d92fab4d427cfca95f420a56f09ddd378'
            'e10e73d7978c137dca55c6d6326e47a5d0b37fe7968751cd74e28542f76d4009')

package() {
  cd "${srcdir}/libreoffice-${pkgver}/dictionaries/no/"
  install -dm755 ${pkgdir}/usr/share/hunspell
  install -m644 nn_NO.aff $pkgdir/usr/share/hunspell
  install -m644 nn_NO.dic $pkgdir/usr/share/hunspell

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/nn_NO.aff ${pkgdir}/usr/share/myspell/dicts/
  ln -sv /usr/share/hunspell/nn_NO.dic ${pkgdir}/usr/share/myspell/dicts/
}

