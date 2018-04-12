# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.4a1
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha512sums=('5575699d2c0c5e4ccbf4ba1dfa9d076216e4172f0074daffe01e73a1f8ce7a821f683bd80de9d2ac0ee422421a25cd60c68a9009bdfe6de8200540d36b204a92')

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
