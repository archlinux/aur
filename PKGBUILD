# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=resp
pkgver=2.2
pkgrel=3
pkgdesc="Standalone RESP charge fitting program"
arch=('i686' 'x86_64')
url="http://upjv.q4md-forcefieldtools.org"
license=('AMBER')
depends=('gcc-libs')
makedepends=('gcc-fortran')
source=("ftp://ftp.desolve.ru/viktor/${pkgname}-${pkgver}.tar.gz")
md5sums=('c0111044db2986323ce84f79f843f662')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 ${srcdir}/${pkgname}-${pkgver}/resp ${pkgdir}/usr/bin/resp
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/README-2.2.txt ${pkgdir}/usr/share/resp/README-2.2.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/resp-2.2.html ${pkgdir}/usr/share/resp/resp-2.2.html
}
