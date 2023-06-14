pkgname=python-pylibftdi
pkgver=0.21.0
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="https://github.com/codedstructure/pylibftdi/"
license=('MIT')
depends=('python' 'libftdi')
makedepends=('python-poetry')
source=("https://github.com/codedstructure/pylibftdi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('87e6502f8fddd4627f2312e496ea6992956f313dab581d02307822c7cb723d5b')

build() {
  cd $srcdir/pylibftdi-$pkgver/
  python -m build --wheel --no-isolation
}


package() {
  cd $srcdir/pylibftdi-$pkgver/
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
