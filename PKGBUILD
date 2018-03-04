# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
pkgname=gcovr
pkgver=3.4
pkgrel=1
pkgdesc="The gcovr script applies the Unix gcov command and generate a simple report that summarizes the coverage."
arch=('any')
url="http://gcovr.com"
license=('custom')
depends=('python2')
makedepends=('python2-distribute')
source=("https://github.com/gcovr/gcovr/archive/${pkgver}.tar.gz")
sha256sums=('1c52a71f245adfe1b45e30fbe5015337fe66546f17f40038b3969b7b42acceed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}

