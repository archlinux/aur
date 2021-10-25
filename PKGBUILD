# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=dbcc
pkgver=1.0.3
pkgrel=1
pkgdesc="CAN DBC to C (and CSV, JSON and XML) compiler"
url="https://github.com/howerj/dbcc"
arch=('x86_64')
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da7db21db480360f792eea93dab46a31a622dada9836824a64fccd6a41375d3b')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package () {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m755 dbcc -t "${pkgdir}/usr/bin"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
