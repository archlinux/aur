# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-arabic-reshaper
pkgver=2.1.4
pkgrel=1
pkgdesc="Reconstruct Arabic sentences to be used in applications that don't support Arabic"
depends=('python-future')
makedepends=('python-setuptools')
optdepends=('python-fonttools')
url="https://github.com/mpcabd/python-arabic-reshaper"
license=('MIT')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('51d62f1c872745a344cf12607666eb72')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
