# Maintainer: aereaux <aidan@jmad.org>
_name=PyFxA
pkgname=python2-fxa
pkgver=0.7.3
pkgrel=1
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=(any)
url="https://github.com/mozilla/PyFxA"
license=('MPL2')
depends=('python2-browserid' 'python2-cryptography' 'python2-hawkauthlib')
makedepends=()
optdepends=()
source=(    https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('04605467c4ce61c237a49721b4cccef4')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
