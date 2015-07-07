# Maintainer: jtts
# From hunspell-sv-se:
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=mythes-sv
pkgver=20101106
pkgrel=8
pkgdesc="Swedish thesaurus"
arch=('i686' 'x86_64')
url="http://lexin2.nada.kth.se/synlex.html"
license=('custom')
depends=('libmythes')
source=('http://extensions.libreoffice.org/extension-center/swedish-thesaurus-based-on-synlex/releases/1.3/swedishthesaurus.oxt')
md5sums=('e1cc53b9a74f31307e342e88c341202b')

package() {
  cd $srcdir/dictionaries
  install -dm755 ${pkgdir}/usr/share/mythes
  install -D -m644 th_sv_SE.dat $pkgdir/usr/share/mythes/th_sv_v2.dat
  install -D -m644 th_sv_SE.idx $pkgdir/usr/share/mythes/th_sv_v2.idx
  install -D -m644 ../Info-en.txt $pkgdir/usr/share/licenses/mythes-sv/Info-en.txt

  pushd ${pkgdir}/usr/share/mythes
  ln -s th_sv_v2.dat th_sv_SE_v2.dat
  ln -s th_sv_v2.idx th_sv_SE_v2.idx
  ln -s th_sv_v2.dat th_sv_FI_v2.dat
  ln -s th_sv_v2.idx th_sv_FI_v2.idx
  popd

  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
  ln -sv /usr/share/mythes/th_sv_v2.dat .
  ln -sv /usr/share/mythes/th_sv_v2.idx .
  ln -sv /usr/share/mythes/th_sv_SE_v2.dat .
  ln -sv /usr/share/mythes/th_sv_SE_v2.idx .
  ln -sv /usr/share/mythes/th_sv_FI_v2.dat .
  ln -sv /usr/share/mythes/th_sv_FI_v2.idx .
  popd
}
