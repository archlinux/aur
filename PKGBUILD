# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=edcount
pkgver=1.2.0
pkgrel=1
pkgdesc='Estimate distinct count of values from standard input. Provides a very fast way to perform unique count estimates on the command line'
arch=('x86_64')
url='https://github.com/haroldfreeman/edcount'
license=('GPL3')
depends=('glibc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/edcount-${pkgver}.tar.gz")
sha256sums=('9b5561aa32ef81096132e84cb1544231c71bad77c0eaeb6a854ae3b4c2938a3d')

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