# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pybind11'
pkgname="${_pkgname}"
pkgver=1.2
pkgrel=1
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code.'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=('python' 'python-setuptools')

source=("https://github.com/wjakob/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('80300aa9061ace3a5eb26d85ee98bc425ba989297d5d6a7dbdd09cabcbe58952')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install_headers --install-dir "${pkgdir}/usr/include/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
