# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
# Contributor: jtts
# From hunspell-sv-se:
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=hyphen-sv
pkgver=1.11
_pkgver=1.11
pkgrel=1
epoch=1
pkgdesc="Swedish hyphenation"
arch=('any')
url="https://extensions.libreoffice.org/en/extensions/show/swedish-hyphenation"
license=('MPL-2.0' 'LGPL-3.0-or-later')
depends=('hyphen')
source=("https://extensions.libreoffice.org/assets/downloads/z/hyph-sv.oxt")
sha256sums=('3542045cc924a21d8b690a569e397b5d3108895e21eae6b09c7c0683d3867a6a')

package() {
  cd $srcdir
  install -dm755 $pkgdir/usr/share/hyphen
  install -D -m644 hyph_sv.dic $pkgdir/usr/share/hyphen/hyph_sv.dic
  install -D -m644 README_hyph_sv.txt $pkgdir/usr/share/licenses/hyphen-sv/README_hyph_sv.txt

  pushd $pkgdir/usr/share/hyphen/
  ln -s hyph_sv.dic hyph_sv_SE.dic
  ln -s hyph_sv.dic hyph_sv_FI.dic
  popd

  install -dm755 $pkgdir/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
  ln -sv /usr/share/hyphen/hyph_sv.dic .
  ln -sv /usr/share/hyphen/hyph_sv_SE.dic .
  ln -sv /usr/share/hyphen/hyph_sv_FI.dic .
  popd
}
