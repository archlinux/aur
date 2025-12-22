# Contributor: Caleb Jamison <cbjamo@gmail.com>
pkgname=python-kinparse
pkgver=1.2.4
pkgrel=2
pkgdesc="Parser for KiCad schematic netlists."
arch=(any)
url="https://github.com/devbisme/kinparse"
license=('MIT')
groups=()
depends=('python' 'python-pyparsing')
makedepends=('python-setuptools')
options=(!emptydirs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('29e9c99996e0d9374a57f82f391638e2a98edcf3581a55f40d04ca2b1954b2a8')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

