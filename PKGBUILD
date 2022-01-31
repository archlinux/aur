# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-arabic-reshaper
pkgver=2.1.3
pkgrel=1
pkgdesc="Reconstruct Arabic sentences to be used in applications that don't support Arabic"
depends=('python-future')
makedepends=('python-setuptools')
optdepends=('python-fonttools')
url="https://github.com/mpcabd/python-arabic-reshaper"
license=('MIT')
arch=('any')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('c070c1e8a186fe6d723c8afb4830ceb1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}