# Maintainer: japm48 <japm48gh@gmail.com>

_pkgname=pygccxml
pkgname=python-${_pkgname}-castxml
pkgver=1.9.1
pkgrel=1


arch=('any')

depends=('castxml' 'python' 'python-setuptools')
provides=('python-gccxml' 'pygccxml')
consflicts=('python-gccxml' 'pygccxml')

pkgdesc="Python package for easy C++ declarations navigation (w/ CastXML and python3)"
url="https://github.com/gccxml/pygccxml"
license=('custom')

source=("https://github.com/gccxml/pygccxml/archive/v${pkgver}.zip")

sha512sums=('f1f68596a8c93472d551a656befe3a3dffdbef80b307291d64314433ca55c0db0fb6f686be795210e3c372926799f0e4f4a3e8d8511cd41040ff81d7bd1e144b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.rst" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.rst"
}


