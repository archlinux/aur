# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=Mathics-Django
pkgver=1.1.0rc1
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.github.io/"
license=('GPL3')
depends=('mathics-scanner' 'mathics' 'python-django' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('74c9a28adf2dfbc606182366c921aa51f2d01999dc2bd8d6254a358a01b142da')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
