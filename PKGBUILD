# Maintainer:
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-visitor
pkgver=0.1.3
pkgrel=1
pkgdesc="A tiny pythonic visitor implementation"
arch=('any')
url="https://github.com/mbr/visitor"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mbr/visitor/archive/$pkgver.tar.gz")
sha512sums=('414c77df8efcc22df5ee8073e02b8c5c28563954ef9b9a869c4ea3f7f1268a97929c1fe29142ba41e3a5acafea52599f6bf073aacd654643d7d8380cd4f41fbc')

build() {
  cd visitor-$pkgver
  python2 setup.py build
}

check() {
  cd visitor-$pkgver
  python2 setup.py pytest
}

package() {
  cd visitor-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
