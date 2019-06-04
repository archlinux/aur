# Maintainer: aereaux <aidan@jmad.org>
pkgname=python2-hawkauthlib
_name=${pkgname#python2-}
pkgver=2.0.0
pkgrel=3
pkgdesc="Low-level library for implementing MAC Access Authentication"
arch=(any)
url="https://github.com/mozilla-services/hawkauthlib"
license=('MPL2')
depends=('python2-requests' 'python2-webob')
makedepends=()
optdepends=()
source=(    https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('bb2257a488c9971ba226bc6ade06c11f')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
