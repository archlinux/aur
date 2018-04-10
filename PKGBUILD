# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pyt
pkgver=0.30
pkgrel=1
pkgdesc='Find security vulnerabilities in Python web applications using static analysis'
arch=('any')
url=https://github.com/python-security/pyt
license=('GPL')
depends=('python-gitpython' 'python-graphviz' 'python-requests')
makedepends=('python-setuptools')
source=("pyt-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5d6e4dc1f7d08c8c13e80ee486f6a91f73060136e9bfa94704959c22d804469e82c6bf1740c94ab9397e53e7363924a9378a3bc841b9c337d104b170948a70e8')

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
