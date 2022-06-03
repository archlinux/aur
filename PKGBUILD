# Contributor: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=pyzbar
pkgver=0.1.9
pkgrel=1
pkgdesc="A ctypes-based wrapper around the zbar barcode reader"
arch=('any')
license=('MIT')
url="https://github.com/NaturalHistoryMuseum/$pkgname/"
depends=('python-pillow' 'zbar')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6b84ec4c1f36df590c65b610a7757ef8829f202a7df210d2891e6592a8bee8bb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 CHANGELOG.md  "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 DEVELOPING.md "$pkgdir/usr/share/doc/$pkgname/DEVELOPING.md"
  install -Dm644 README.rst    "$pkgdir/usr/share/doc/$pkgname/README.rst"
  install -Dm644 LICENSE.txt   "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
