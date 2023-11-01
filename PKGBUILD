# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-arabic-reshaper
pkgver=3.0.0
pkgrel=1
pkgdesc="Reconstruct Arabic sentences to be used in applications that don't support Arabic"
depends=('python')
makedepends=('python-setuptools')
optdepends=('python-fonttools')
url="https://github.com/mpcabd/python-arabic-reshaper"
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('98b0e1932b79b2fd990d2674d8c75b96')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
