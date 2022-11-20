# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-voluptuous
pkgver=0.13.1
pkgrel=1
pkgdesc="A Python 3.8 data validation library"
url="https://github.com/alecthomas/voluptuous"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=(https://github.com/alecthomas/voluptuous/archive/refs/tags/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('874960bdd3fce213e46f8017fbc56ede02133de6f8cb439d810db38ca06d9c5fcf5496150ef4c73fd19d9e06489ba08a510fd96aa16b8825564a52fd01cc3f4f')

build() {
  cd voluptuous-$pkgver
  python3..8 setup.py build
}

check() {
  cd voluptuous-$pkgver
  pytest
}

package() {
  cd voluptuous-$pkgver
  python3..8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname/
}
