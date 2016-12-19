# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=libsrs_alt
pkgver=1.0
pkgrel=1
pkgdesc="SRS supporting library (mainly used in exim)"
arch=('i686' 'x86_64')
url="http://opsec.eu/src/srs/"
license=('GPL')
depends=('glibc')
source=(https://opsec.eu/src/srs/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('09a4b82cec25044c0883e382060451ef757eb530')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
