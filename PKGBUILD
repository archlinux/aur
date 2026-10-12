# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-arrapi'
_name=${pkgname#python-}
pkgver=1.5.1
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
sha512sums=('6f29b15fd28d74cc20ccbdb0ce86174f0673aa5f16a9ab2446fdf1dce7661cfaa211e23f9ee01eea12fa41dc9525c941232a8278ef5f7598bca8b28c34d4684b')

package() {
  cd arrapi-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
