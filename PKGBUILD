# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-ioisis')
pkgver=0.3.0
pkgrel=1
pkgdesc="I/O tools for converting ISIS data in Python"
arch=('any')
url='https://github.com/scieloorg/ioisis'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-construct' 'python-jpype1' 'python-ujson')
options=(!emptydirs)
sha256sums=('c83ac6efa02ac0176a86144f9910a99b3accf2bf290df74651cc3a99b861e80e')
source=("ioisis-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/ioisis-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
