# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-validators
pkgver=0.20.0
pkgrel=1
pkgdesc="Python Data Validation for Humans"
url="https://github.com/kvesteri/validators"
license=('MIT')
arch=('any')
depends=('python38-decorator' 'python38-six')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://github.com/kvesteri/validators/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('45a07c061022da453c31fc946950be3a701f36afbf0e0eb82b91f4bdb26c4d2d0ab47f6958ac88fd2e0a1563201e946014a5cb93cfa1c6710411982852d571c7')

build() {
  cd validators-$pkgver
  python3.8 setup.py build
}

check() {
  cd validators-$pkgver
  python3.8 -m pytest
}

package() {
  cd validators-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
