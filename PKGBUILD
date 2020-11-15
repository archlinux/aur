# Maintainer:  GI Jack <GI_Jack@hackermail.com>

pkgbase=python-ecpy
pkgname='python-ecpy'
pkgver=1.2.5
pkgrel=1
arch=('any')
pkgdesc='Pure Python Elliptic Curve Library for Python'
url='https://github.com/ubinity/ECPy'
license=('custom')
source=("${pkgname}-${pkgver}::https://github.com/cslashm/ECPy/archive/1.2.5.tar.gz")
sha256sums=('02a2e990fe4b9c51a5a2d7518439ad80e5d839c931f76fa5144c50543e6a103f')
makedepends=('python' 'python-setuptools' 'python-future')

build() {
  cd ECPy-${pkgver}
  python setup.py build
}

package() {
  cd ECPy-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}



