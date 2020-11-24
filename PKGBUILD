# Maintainer: Johan Liljeqvist <johan (at) liljeq.net>
# From hunspell-sv-se:
# Contributor: jtts
# Contributor: Oscar Carlsson <oscar.carlsson (at) gmail.com>

pkgname=mythes-sv
pkgver=20101106
_pkgver=1.3
pkgrel=9
pkgdesc="Swedish thesaurus"
arch=('any')
url="http://lexin2.nada.kth.se/synlex.html"
license=('custom')
depends=('libmythes')
source=("https://extensions.libreoffice.org/assets/downloads/z/swedishthesaurus.oxt")
sha256sums=('58de0797f5dca60b7dd5e2355c381eb4ced72aff7a726861a2512ebc2e97ad55')

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
