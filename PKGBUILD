# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
pkgname=gcovr
pkgver=4.1
pkgrel=1
pkgdesc="The gcovr script applies the Unix gcov command and generate a simple report that summarizes the coverage."
arch=('any')
url="http://gcovr.com"
license=('custom')
depends=('python' 'python-jinja')
source=("https://github.com/gcovr/gcovr/archive/${pkgver}.tar.gz")
sha256sums=('1ad8042fd4dc4c355fd7e605d395eefa2a59b1677dfdc308e0ef00083e8b37ee')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

