# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pyt
pkgver=0.2.0
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-gitpython' 'python-graphviz' 'python-requests')
makedepends=('python-setuptools')
source=("pyt-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('85812050d8b7a5ffaf3fdb2ab28e014522cb04fd8808a489f45c67646e7bc4d020454d4e53b0623430bac481420e5fe5519979fb91137d8660f8e5e8c38d5cce')

prepare() {
  cd pyt-$pkgver
  sed -i 's/==/>=/g' setup.py
}

build() {
  cd pyt-$pkgver
  python setup.py build
}

check() {
  cd pyt-$pkgver
  python -m tests
}

package() {
  cd pyt-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
