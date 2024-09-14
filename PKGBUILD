# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=Mathics-Django
pkgver=7.0.0
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'mathics' 'python-django' 'python-networkx' 'python-requests' 'python-pygments')
makedepends=('python-setuptools')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('b1756bff76799f75c08c0c66741b2a12f3927bec462272d3182bc5d427c08c09')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
