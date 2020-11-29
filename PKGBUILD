# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-colander
pkgver=1.8.3
pkgrel=1
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('any')
depends=('python-iso8601' 'python-setuptools' 'python-translationstring')
checkdepends=('python-pytest-cov' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('cf405891a208c897d208b45aca0c5cf975536658044d9782035e743cd5796f12564955105ea692da486978eb656da909a2e4a2c3ee4e3b4f578f057e5d63e782')

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
