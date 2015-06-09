# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=juman
pkgver=7.01
pkgrel=1
pkgdesc="Morphological Analyzer for Japanese"
url="http://nlp.ist.i.kyoto-u.ac.jp/index.php?JUMAN"
arch=('i686' 'x86_64')
license=('custom')
source=(http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('e22eb113f40216b8a04d811484a94f93f834ae9a')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make ${MAKEFLAGS}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

# vim:set ts=2 sw=2 et:
