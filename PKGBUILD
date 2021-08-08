#Maintainer: Liam Timms <timms5000@gmail.com>

_pkgname=etelemetry
pkgname=python-$_pkgname
_name=${pkgname#python-}
pkgver=0.2.2
pkgrel=1
pkgdesc="Etelemetry python client API"
url="https://github.com/sensein/etelemetry-client"
arch=('any')
license=('apache')
depends=('python-ci-info')
provides=("python-etelemetry")
options=(!emptydirs)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/sensein/etelemetry-client/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bfec416552d248ad0f50b90ba5ff015e825ad70e4a87f7a06cc7da6d19152897')

build() {
  cd "$srcdir/$_pkgname-client-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-client-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

