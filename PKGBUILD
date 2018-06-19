# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
pkgname=gcovr
pkgver=4.0
pkgrel=1
pkgdesc="The gcovr script applies the Unix gcov command and generate a simple report that summarizes the coverage."
arch=('any')
url="http://gcovr.com"
license=('custom')
depends=('python' 'python-jinja')
source=("https://github.com/gcovr/gcovr/archive/${pkgver}.tar.gz")
sha256sums=('f9731a0ea516f2087e13b3bc310dbd8edaec4ce6a56b2462f5603ee925f40377')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

