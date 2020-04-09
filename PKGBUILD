# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=edcount
pkgver=1.2.0
pkgrel=1
pkgdesc='Estimate distinct count of values from standard input. Provides a very fast way to perform unique count estimates on the command line'
arch=('x86_64')
url='https://github.com/haroldfreeman/edcount'
license=('GPL-3.0')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('99fe6c46d4c12494af3ff78c96ebea4e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -i
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et: