# Maintainer: aereaux <aidan@jmad.org>
_name=PyBrowserID
pkgname=python2-browserid
pkgver=0.14.0
pkgrel=3
pkgdesc="Python client library for the BrowserID protocol"
arch=(any)
url="https://github.com/mozilla/PyBrowserID"
license=('MPL2')
depends=('python2-requests')
makedepends=()
optdepends=()
source=(    https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('fdfd2b65fbd3939332b90b6d2089ce59')

build() {
  cd "$_name-$pkgver"

  python2 setup.py build
}

package() {
  cd "$_name-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
