# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.3a2
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha512sums=('2ce4703ba37b1484c2c2de4cd39a1d9fb3128b48b418cd060b12825e3f754dd5a75c3079a450dd6885d064c17f9117808215c3539bbf90316032b3560074440d')

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
