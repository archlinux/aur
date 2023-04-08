# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-colander
pkgver=2.0
pkgrel=2
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('any')
depends=('python-iso8601' 'python-translationstring')
makedepends=('python-babel' 'python-setuptools')
checkdepends=('python-pytest-cov' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('3202129abba4defba22e373913873d0aeda9fa224d99c309aa379c227cfa88eb01ae58f3d9200f87eb8f70e4cba029149a7773ba54db2ec0bea654fd5066547b')

build() {
  cd colander-$pkgver
  python setup.py build
}

check() {
  cd colander-$pkgver
  python setup.py pytest
}

package() {
  cd colander-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
