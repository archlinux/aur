# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=Mathics-Django
pkgver=2.0.0
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'mathics' 'python-django' 'python-networkx' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('9f99ddae7d0824ff056ddb9e0f7ac79fbc932aa34a5200f8d5ac8ce3cb44c4d4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
