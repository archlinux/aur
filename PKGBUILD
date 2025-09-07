# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=${pkgname//-/_}
pkgver=9.0.0
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
sha256sums=('bab73e5ed27e4439f2821348a475c60a78e7fd857337c30d547f82d385e1d497')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
