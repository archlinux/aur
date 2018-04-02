# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.4a0
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha512sums=('22cf3cf7e4490d132be229ae8077b62c297c6d9c2c863fd4a4a8053e7e19abbd81493526a786f132bf6e0144384d06053349d8e27d8007fe9805adec44269751')

build() {
  cd black-$pkgver
  python setup.py build
}

check() {
  cd black-$pkgver
  python -m unittest tests/test_black.py
}

package() {
  cd black-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/black/LICENSE
}

# vim:set ts=2 sw=2 et:
