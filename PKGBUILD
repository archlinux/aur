# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Giacomo Vercesi <mrjackv@hotmail.it>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Florian Wittmann

_pypi_name='tcconfig'
pkgname="python-${_pypi_name}"
pkgver=0.30.1
pkgrel=1
pkgdesc='tc command wrapper'

url='https://github.com/thombashi/tcconfig'
_url_pypi='https://pypi.org/project/tcconfig'
license=('MIT')
arch=('any')

makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer' 'python-hatchling')
depends=('python' 'python-docker' 'python-dataproperty' 'python-humanreadable' 'python-loguru' 'python-msgfy' 'python-path' 'python-pyparsing' 'python-pyroute2' 'python-simplesqlite' 'python-subprocrunner' 'python-typepy' 'python-voluptuous' 'python-importlib-metadata' 'python-ujson' 'python-pkg_resources')

source=("https://files.pythonhosted.org/packages/source/${_pypi_name::1}/${_pypi_name}/${_pypi_name}-${pkgver}.tar.gz")
sha256sums=('71026a22d2be180ff7e251b860e448029d1dd3f5a3be1a11b1a19b4ccb4bbf60')

build() {
  cd "${_pypi_name}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pypi_name}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dvm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
