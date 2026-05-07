# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics3-django
_pkgname=${pkgname//-/_}
pkgver=10.0.0
pkgrel=1
pkgdesc="The Django front-end to Mathics."
arch=('any')
url="https://github.com/Mathics3/Mathics3-django"
license=('GPL3')
depends=('mathics3-scanner'
         'mathics3'
         'python-django'
         'python-pygments'
         'python-requests'
         'python-scikit-image'
         'python-networkx')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
conflicts=('mathics-django')
replaces=('mathics-django')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('0db730d7dc9799bee34e95c12130be6b021d506e1beb362fd9544a433eaeb4f2')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
