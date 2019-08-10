# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=4.0
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
provides=('python-restrictedpython')
conflicts=('python-restrictedpython')
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('551a6976b42e94d9f9e1eb643761108e891a9d8cb920432c4450a37676d2f1375d6ddb7c28787830dabba9f07d846da151d0b02628785d55b253949abb92aadc')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  py.test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root $pkgdir
}
