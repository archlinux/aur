# Maintainer: Daniel M. Capella <polycitizen@gmail.com>
# Maintainer: James Zhu <jameszhu@berkeley.edu>

pkgname=python-black
pkgver=18.9b0
pkgrel=1
pkgdesc='Uncompromising Python code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python' 'python-appdirs' 'python-attrs' 'python-click' 'python-toml')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha512sums=('80f94867220f7511dfc72aa8886586530d33187e10c57a7721cb0c97e906941ef811811ef0b2afa77d5454ce00114f3724063a890c41af4d7b68ec59dee29a48')

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
