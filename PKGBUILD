# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=Mathics-Django
pkgver=4.0.1
pkgrel=2
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'mathics' 'python-django' 'python-networkx' 'python-requests')
makedepends=('python-setuptools')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('c7dc40653b1355d52a6cbe5be0a15c80d6f610825f599a096be4ce8f733adac6')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
