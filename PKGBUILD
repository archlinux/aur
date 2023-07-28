# Maintainer: loukii
pkgname=python-pangu
pkgver="4.0.6.1"
pkgrel=2
arch=('any')

url='https://github.com/vinta/pangu.py'
pkgdesc='Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols).'
license=('MIT')

_name=${pkgname#python-}

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