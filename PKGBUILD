# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.4a4
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha512sums=('089d170691f2879bd2a914f1f24b45ec4a228f51ae4d72202f928b64ce0e626cba11e49bf9799a7fcfe61980a5b1ea9269358a528e21fd16acbfdbf73f862d86')

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
