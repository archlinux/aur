# Maintainer: jtts
# From hunspell-sv-se:
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=hunspell-vi
pkgver=20160613
_pkgver=2.40
__pkgver=2-40
pkgrel=1
pkgdesc="Vietnamese dictionaries for Hunspell"
arch=('any')
url="https://github.com/1ec5/hunspell-vi"
license=('LGPL3')
depends=('hunspell')
source=("http://downloads.sourceforge.net/project/aoo-extensions/917/3/vi_spellchecker_ooo3.oxt?r=http%3A%2F%2Fextensions.openoffice.org%2Fen%2Fproject%2FVietnamese_SpellChecker&ts=1471931429&use_mirror=pilotfiber")
sha256sums=('SKIP')

package() {
  cd $srcdir/dictionaries
  install -D -m644 vi_VN.dic $pkgdir/usr/share/hunspell/vi_VN.dic
  install -D -m644 vi_VN.aff $pkgdir/usr/share/hunspell/vi_VN.aff

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
  ln -sv /usr/share/hunspell/vi_VN.dic .
  ln -sv /usr/share/hunspell/vi_VN.aff .
  popd
}
