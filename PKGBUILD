# Maintainer: Michał Sałaban <michal@salaban.info>
pkgname="python2-revolut"
_projname="revolut-python"
pkgver=0.4
pkgrel=1
pkgdesc='Revolut API client for Python'
license=('BSD')
arch=('any')
url='https://github.com/emesik/revolut-python'
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-requests' 'python2-dateutil')
source=("https://github.com/emesik/${_projname}/archive/v${pkgver}.tar.gz")
md5sums=('daf6817d2a2599f76d1028ff97127f80')

build() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_projname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
