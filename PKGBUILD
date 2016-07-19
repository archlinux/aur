# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pybind11'
pkgname="${_pkgname}"
pkgver=1.8.1
pkgrel=1
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code.'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=('python' 'python-setuptools')

source=("https://github.com/wjakob/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('321de8881ff0e113087b9e996d77777417b7db05bc4536b365f648b5fadc27b8')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install_headers --install-dir "${pkgdir}/usr/include/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
