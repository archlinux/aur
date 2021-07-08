# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=Mathics-Django
pkgver=3.1.0
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'mathics' 'python-django' 'python-networkx' 'python-requests')
makedepends=('python-setuptools')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('28c16bf18e21bf14a19b29e044303f9d48075628897bd7fa4b7dce7be6597706')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
