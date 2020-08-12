# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-colander
pkgver=1.8.0
pkgrel=1
pkgdesc="A simple schema-based serialization and deserialization library"
url="https://docs.pylonsproject.org/projects/colander/en/latest/"
license=('BSD')
arch=('any')
depends=('python-iso8601' 'python-setuptools' 'python-translationstring')
checkdepends=('python-pytest-cov' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pylons/colander/archive/$pkgver.tar.gz")
sha512sums=('43ab774e3c73942bd1d744e631763104d3a5bb0ca8baa26b8af65b6b3e3c3b90e58c09437d28c157dde4fe9f6dda6a8afa5320de02151d96a812a22c8973b0ce')

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
