
_name=docstring_parser
pkgname="python-${_name/_/-}"
pkgdesc="Parse Python docstrings"
pkgver=0.7.3
pkgrel=1
depends=('python')
arch=(any)
url="https://github.com/rr-/docstring_parser"
license=(MIT)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cde5fbf8b846433dfbde1e0f96b7f909336a634d5df34a38cb75050c7346734a')

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

