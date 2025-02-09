# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=${pkgname//-/_}
pkgver=8.0.1
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner'
         'mathics'
         'python-django'
         'python-matplotlib'
         'python-networkx'
         'python-requests'
         'python-pygments')
makedepends=('python-setuptools')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('f896fef54e0aa19fe2eb13f650540c49481679843101f912f97b30c3c5a99bb3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
