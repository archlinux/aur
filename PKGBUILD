# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-django
_pkgname=Mathics-Django
pkgver=2.1.0
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('mathics-scanner' 'mathics' 'python-django' 'python-networkx' 'python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('e03982e83d7cdf47986139e0a1ba1ce53b7f1c540b4cdf8c3f52fbe7f09721f2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
