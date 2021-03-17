# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-monero"
_projname="monero-python"
pkgver=0.8.1
pkgrel=1
pkgdesc='A comprehensive Python module for handling Monero cryptocurrency'
license=('BSD')
arch=('any')
url='https://github.com/monero-ecosystem/monero-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests' 'python-pysha3' 'python-six')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('b7125b3f5e25dbc7c4c433e27197ba67')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
