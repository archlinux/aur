# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python-revolut"
_projname="revolut-python"
pkgver=0.6
pkgrel=1
pkgdesc='Revolut API client for Python'
license=('BSD')
arch=('any')
url='https://github.com/emesik/revolut-python'
makedepends=('python' 'python-distribute')
depends=('python' 'python-requests' 'python-dateutil' 'python-pyjwt')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('9bfc19f1a0fed6ec984344d5030ee6a4')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
