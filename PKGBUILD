# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-arrapi'
_name=${pkgname#python-}
pkgver=1.4.11
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
sha512sums=('eb4c63a5dfa039c07dd042152e23fe103ee352c3f6df9ed087501d64edb5a014fd915813d65bbabb8a6f12f9fef685d1b1e448e59546a79d8cac70b58b3f25d1')

package() {
  cd arrapi-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
