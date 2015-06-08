# Maintainer: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>
pkgname=gcovr
pkgver=3.2
pkgrel=1
pkgdesc="The gcovr script applies the Unix gcov command and generate a simple report that summarizes the coverage."
arch=('any')
url="http://gcovr.com"
license=('custom')
makedepends=('python2' 'python2-distribute')
depends=('python2' 'python2-distribute')
source=("https://github.com/gcovr/gcovr/archive/${pkgver}.tar.gz")
sha256sums=('5a969caf61452705a39f6642f4707d23644bdd2e5ef913014bf95c4bd0263db6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt || return 1
}


