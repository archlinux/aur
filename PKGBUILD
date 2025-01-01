#Contributor: Liam Timms <timms5000@gmail.com>

_pkgname=etelemetry
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=0.3.1
pkgrel=1
pkgdesc="Etelemetry python client API"
url="https://github.com/sensein/etelemetry-client"
arch=('any')
license=('apache')
depends=('python-ci-info' 'python' 'python-packaging' 'python-requests')
makedepends=('python-setuptools')
provides=("python-etelemetry")
options=(!emptydirs)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sensein/etelemetry-client/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('91861fc0e9593e583ad12610a99859d88a45216f59e803c96cfa8b7334f6171f')

build() {
  cd "$srcdir/$_pkgname-client-$pkgver"
  rm -r etelemetry/tests
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

