# Maintainer: Simon Brulhart <simon@brulhart.me>
pkgname=cde
pkgver=0.1
pkgrel=1
pkgdesc="Automatically create portable Linux applications (formerly CDEpack)"
url="http://www.pgbovine.net/cde.html"
arch=('x86_64' 'i686')
license=('GPL3')
source=("https://github.com/pgbovine/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8a9236ca9c38b0101bd931f24b09c32d')

build() {
  cd "${srcdir}/${pkgname^^}-${pkgver}"
  make -j1
}

package() {
  cd "${srcdir}/${pkgname^^}-${pkgver}"
  mkdir -p ${pkgdir}/usr/bin
  make PREFIX=${pkgdir}/usr install
}

# vim:set ts=2 sw=2 et:
