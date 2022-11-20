# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-constantly
pkgver=15.1.0
pkgrel=11
pkgdesc='Symbolic constants in Python'
arch=('any')
license=('MIT')
url='https://github.com/twisted/constantly'
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner' 'python38-twisted')
source=("https://github.com/twisted/constantly/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('eeaa74552fe8e01c40566ac3c8b3d41085f800863ac516e30fe1242f40d3401e4e872279149776f29d3ba78a7a16337a794ad26230efab4dd1847d42bffa81ce')

build() {
  cd constantly-$pkgver
  python3.8 setup.py build
}

check() {
  cd constantly-$pkgver
  python3.8 setup.py ptr
}

package() {
  cd constantly-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
