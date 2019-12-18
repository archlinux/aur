# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-ioisis')
pkgver=0.2.0
pkgrel=1
pkgdesc="I/O tools for converting ISIS data in Python"
arch=('any')
url='https://github.com/scieloorg/ioisis'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-construct' 'python-jpype1' 'python-ujson')
options=(!emptydirs)
sha256sums=('b943543e2494c4996f7f000b7cd6ea7e11722e7a71552289f4b3287417fe32ad')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/ioisis-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
