# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-pytest-lazy-fixture
_pkgname=pytest-lazy-fixture
pkgver=0.6.3
pkgrel=1
pkgdesc="Use your fixtures in pytest.mark.parametrize"
arch=('any')
url="https://github.com/tvorog/pytest-lazy-fixture"
license=('MIT')
depends=('python' 'python-pytest')
optdepends=()
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('0e7d0c7f74ba33e6e80905e9bfd81f9d15ef9a790de97993e34213deb5ad10ac')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  PYTHONPATH=. pytest tests
}

## vim:ts=2:sw=2:et:
