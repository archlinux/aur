# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pyt
pkgver=0.1
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-gitpython' 'python-graphviz' 'python-requests')
makedepends=('python-setuptools')
source=("pyt-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('473ae64ea3447faa09156795f1011eecd50a905f9555273f65db0fe4626a6c122812d4a37f35dcbc36a247cf60b4fff57e73b1bc628ed3529f04b3d30a16b7e3')

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
