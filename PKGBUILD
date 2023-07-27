pkgname=python-pangu

_name=${pkgname#python-}

pkgver="4.0.6.1"
pkgrel=1
arch=('any')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha256sums=('f799d127709fe5ecff5d476945ac63d4be758b7bda02efb95715f1dc24472a2f')

depends=()

makedepends=('python-setuptools')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}