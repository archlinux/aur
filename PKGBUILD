# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-spyder-kernels
_pkgname='spyder-kernels'
pkgver=0.5.2
pkgrel=1
pkgdesc='Jupyter Kernels for the Spyder console'
makedepends=('python2' 'python2-setuptools')
depends=('python2-ipykernel' 'python2-cloudpickle')
arch=('any')
url="https://github.com/spyder-ide/${_pkgname}/"
license=('MIT')
source=("python-${_pkgname}-${pkgver}.tar.gz"::"https://github.com/spyder-ide/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('861b7547ef407e1a02f315a9f54fe55fe21b516e6d40b7be0df524a85baf664e')

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license file
  install -D -m 644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

