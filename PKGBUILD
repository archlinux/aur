# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-ioisis')
pkgver=0.1.0
pkgrel=1
pkgdesc="I/O tools for converting ISIS data in Python"
arch=('any')
url='https://github.com/scieloorg/ioisis'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-click' 'python-construct' 'python-jpype1' 'python-ujson')
options=(!emptydirs)
sha256sums=('f272777bef353bea61e0c256270683f58cef8afa1c324739b52c1f94efe2af89')
source=("$url/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/ioisis-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
