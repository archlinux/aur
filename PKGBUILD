# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-arrapi'
_name=${pkgname#python-}
pkgver=1.4.14
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
sha512sums=('6004ea94fce98defa0165b7c0804fcb2e5279e4acfecb907c8013236b97d5745aac5fed868572fc97425b496f4b30248e52bbdbab1443e7f440e5ac35919e778')

package() {
  cd arrapi-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
