# Maintainer: Benjamin Winger <bmw@disroot.org>

_pkgname=RestrictedPython
pkgname=python-restrictedpython
pkgver=6.2
pkgrel=1
pkgdesc="A restricted execution environment for Python to run untrusted code"
arch=(any)
url="https://github.com/zopefoundation/RestrictedPython"
license=(ZPL)
depends=("python")
makedepends=("python" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-mock")
source=("https://github.com/zopefoundation/$_pkgname/archive/$pkgver.tar.gz")
b2sums=('cac63465192d425dc2b18a787fe4e75749f19768bbcb3be921512ccf0558e30f8ab3f8a89c36b77d370ae2c160b5aba4e9481ad66c36909b7189559c20a532fe')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=src py.test
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root $pkgdir --optimize=1
}
