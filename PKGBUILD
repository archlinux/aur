# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-rstr
pkgver=2.2.4
pkgrel=1
pkgdesc="Generate random strings in Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
source=(https://files.pythonhosted.org/packages/source/r/rstr/rstr-$pkgver.tar.gz)
sha256sums=('64a086a7449a576de7f40327f8cd0a7752efbbb298e65dc68363ee7db0a1c8cf')

build() {
  cd "$srcdir"/rstr-$pkgver
  python2 setup.py build
}

package() {
  cd "$srcdir"/rstr-$pkgver
  python2 setup.py install -O1 --skip-build --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
