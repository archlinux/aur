# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=edcount
pkgver=1.2.0
pkgrel=1
pkgdesc='Estimate distinct count of values from standard input. Provides a very fast way to perform unique count estimates on the command line'
arch=('x86_64')
url='https://github.com/haroldfreeman/edcount'
license=('GPL-3.0')
source=("${url}/releases/download/v${pkgver}/edcount-${pkgver}.tar.gz")
md5sums=('d66fabc13d1112a936e14bf0ac14e6d1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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