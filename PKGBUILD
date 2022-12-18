# Maintainers: James Spencer <james.s.spencer@gmail.com>
#              Darjan Krijan [https://disc-kuraudo.eu]

pkgname=otf2
pkgver=3.0.2
pkgrel=1
pkgdesc="Scalable, memory efficient event trace data format and support library."
arch=('i686' 'x86_64')
url="http://www.vi-hps.org/projects/score-p/"
license=('BSD')
options=('staticlibs')
source=(http://perftools.pages.jsc.fz-juelich.de/cicd/${pkgname}/tags/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('ae3a7ad83055d8f873738fee5031470652d31b9bcbf223dd556aea41f5f62303')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-shared
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
