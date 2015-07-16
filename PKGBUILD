# Maintainer: Dominik Pieczyński <dominik.pieczynski@gmail.com>

pkgname=python-picamera
pkgver=1.10
pkgrel=1
pkgdesc="A pure Python interface to the Raspberry Pi camera module"
arch=('any')
url="https://pypi.python.org/pypi/picamera/1.10"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')

source=(https://pypi.python.org/packages/source/p/picamera/picamera-$pkgver.tar.gz)
sha256sums=('f0dfc3a6983f63da2ff7cbefeedcacb8c98cc41ad651e55148e8f798940ca73d')

package() {
  cd "$srcdir/picamera-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
