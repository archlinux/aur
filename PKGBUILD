# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-arrapi'
_name=${pkgname#python-}
pkgver=1.4.7
pkgrel=1
pkgdesc="A set of tools based around the requests library for safely making HTTP requests on behalf of a third party."
arch=('any')
url="https://github.com/meisnate12/ArrAPI"
license=('MIT')
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('2b9d80ff97353216c6a3762bf5186474e9489e9b3a99eca2bd99a50c91100abed99b108ed53cf47d54da6b7b62ad5794f3e09e01039755c21ba59597fb92e1a7')

package() {
  cd arrapi-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
