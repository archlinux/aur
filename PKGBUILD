# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
pkgname=gcovr
pkgver=3.3
pkgrel=2
pkgdesc="The gcovr script applies the Unix gcov command and generate a simple report that summarizes the coverage."
arch=('any')
url="http://gcovr.com"
license=('custom')
depends=('python2')
makedepends=('python2-distribute')
source=("https://github.com/gcovr/gcovr/archive/${pkgver}.tar.gz")
sha256sums=('8a60ba6242d67a58320e9e16630d80448ef6d5284fda5fb3eff927b63c8b04a2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

