# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-xtermcolor
_name=xtermcolor
pkgver=1.3
pkgrel=5
pkgdesc='Python module for colorizing output with xterm 256 color support'
arch=('any')
url='https://pypi.python.org/pypi/xtermcolor'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('66dd9f4b1489ba8a24d5be746fbbd70ecbe55a9cc1795ab552e9734e14bdbcdd')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
