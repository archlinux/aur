
pkgname=python2-constantly
pkgver=15.1.0
pkgrel=9
pkgdesc='Symbolic constants in Python'
arch=('any')
license=('MIT')
url='https://github.com/twisted/constantly'
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tgz::https://github.com/twisted/constantly/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('eeaa74552fe8e01c40566ac3c8b3d41085f800863ac516e30fe1242f40d3401e4e872279149776f29d3ba78a7a16337a794ad26230efab4dd1847d42bffa81ce')

build() {
  cd constantly-$pkgver
  python2 setup.py build
}

package() {
  cd constantly-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
