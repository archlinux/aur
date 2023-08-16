
_name=docstring_parser
pkgname="python-${_name/_/-}"
pkgdesc="Parse Python docstrings"
pkgver=0.15
pkgrel=1
depends=('python')
arch=(any)
url="https://github.com/rr-/docstring_parser"
license=(MIT)
depends=('python-pytest')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('48ddc093e8b1865899956fcc03b03e66bb7240c310fac5af81814580c55bf682')

package() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

