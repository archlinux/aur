# Maintainer: Matthew Ellison <matt+aur@arroyonetworks.com>

_pkgname='pybind11'
pkgname="${_pkgname}"
pkgver=1.4
pkgrel=1
pkgdesc='A lightweight header-only library to create Python bindings of existing C++ code.'
arch=('any')
url='http://pybind11.readthedocs.org/'
license=('BSD')
optdepends=('python: to target bindings supporting python 3'
            'python2: to target bindings supporting python 2')
makedepends=('python' 'python-setuptools')

source=("https://github.com/wjakob/pybind11/archive/v${pkgver}.tar.gz")
sha256sums=('05e0bb659756f0a8677aa71f78ae5858845f50c604d6f56d5c7584f93cc7f628')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install_headers --install-dir "${pkgdir}/usr/include/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
