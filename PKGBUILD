pkgname=python-pylibftdi
pkgver=0.22.0
pkgrel=1
pkgdesc="Pythonic interface to FTDI devices using libftdi"
arch=(any)
url="https://github.com/codedstructure/pylibftdi/"
license=('MIT')
depends=('python' 'libftdi')
makedepends=('python-poetry')
source=("https://github.com/codedstructure/pylibftdi/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('21353e1c61ad8aa7884747a862de1f89a088af94b0175e32e02d5bc205142075')

build() {
  cd $srcdir/pylibftdi-$pkgver/
  python -m build --wheel --no-isolation
}


package() {
  cd $srcdir/pylibftdi-$pkgver/
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
