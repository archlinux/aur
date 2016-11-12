# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=juman++
_pkgname=jumanpp
pkgver=1.01
pkgrel=1
pkgdesc="Morphological Analyzer for Japanese"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN++"
arch=('i686' 'x86_64')
license=('custom')
source=(http://nlp.ist.i.kyoto-u.ac.jp/DLcounter/lime.cgi?down=http://lotus.kuee.kyoto-u.ac.jp/nl-resource/${_pkgname}/${_pkgname}-${pkgver}.tar.xz)
depends=('gperftools' 'boost' 'libunwind')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
sha1sums=('ade88cc73f44d71de8d21ea89ca5608cb5e33332')
