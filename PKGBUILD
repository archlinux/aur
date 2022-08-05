# Maintainer: Firas Zaidan <firas@zaidan.de>
# Contributor: Erich Eckner <arch at eckner dot net>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python2-numexpr
pkgver=2.7.3
pkgrel=1
pkgdesc="Fast numerical array expression evaluator for Python, NumPy, PyTables, pandas"
url="https://github.com/pydata/numexpr"
arch=('x86_64' 'i686' 'pentium4')
license=('MIT')
depends=(
  'python2>=2.7'
  'python2<2.8'
  'python2-numpy'
)
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pydata/numexpr/archive/v$pkgver.tar.gz")
sha256sums=('00d6b1518605afe0ed10417e0ff07123e5d531c02496c6eed7dd4b9923238e1e')

build() {
  cd "$srcdir"/numexpr-$pkgver
  python2 setup.py build
}
package() {
  cd "$srcdir"/numexpr-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
