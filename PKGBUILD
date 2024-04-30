# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-arrapi'
_name=${pkgname#python-}
pkgver=1.4.13
pkgrel=2
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
sha512sums=('b8aac3cb18e09e1a6c0fc3dae66ce89dba63b5c44ee823a9e48cda6061c4b4d90a9fba31489db3df2b339806925405d74372b49b4b814a57a2fd8432a1756772')

package() {
  cd arrapi-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}
