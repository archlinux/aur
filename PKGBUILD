# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=dbcc
pkgver=1.2.0
pkgrel=1
pkgdesc="CAN DBC to C (and CSV, JSON and XML) compiler"
url="https://github.com/howerj/dbcc"
arch=('x86_64')
license=('MIT')
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('99047e5e9e320a41837243fdc3e40d3615bdf3e99742fbec8dd7fdf7bc67ba93')

build () {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package () {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -D -m755 dbcc -t "${pkgdir}/usr/bin"
  install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
