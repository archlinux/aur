# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=black
pkgver=18.3a3
pkgrel=1
pkgdesc='Uncompromising code formatter'
arch=('any')
url=https://github.com/ambv/black
license=('MIT')
depends=('python-attrs' 'python-click')
source=("https://files.pythonhosted.org/packages/source/b/black/black-$pkgver.tar.gz")
sha512sums=('1f490b4d6f6d760c930c7615f50a9d1269f750a91d645f42e222e5bf40919c22a6a5d4c00fad4b5bf0750728096d4ac7d71ab40f248a2b09aa3f32ff281ddeee')

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
