# Maintainer: David Runge <dave@sleepmap.de>

pkgname=python-iwlib
pkgver=1.5
pkgrel=1
pkgdesc='Python module to interface with iwlib'
arch=('any')
url='https://github.com/nathan-hoad/python-iwlib'
license=('GPL2')
depends=('python' 'iw')
makedepends=()
source=("https://github.com/nathan-hoad/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2b79e412949a465d1383620745b6bfbf5924ef8ed47d459882afc5c86e54d10d1b963055df7076a481fb7bd6ade1d318ce35ed36ee5c129c048bbf6b1790f432')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}/"
  install -D -m644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}
