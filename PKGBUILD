# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-colander
pkgver=1.7.0
pkgrel=4
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('any')
depends=('python-translationstring' 'python-iso8601')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('6f1862c8d4eb615365fe9b833ea679711e4af9fea8060d3da05ca31dca67ba70fef5c6a93ea3dd7d006cf894d465431296fc55902712ac8b5f95463ec4a55d9e')

build() {
  cd colander-$pkgver
  python setup.py build
}

check() {
  cd colander-$pkgver
  python setup.py nosetests
}

package() {
  cd colander-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
