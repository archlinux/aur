# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-nose-random
_pkgname=nose-random
pkgver=1.0.0
pkgrel=10
pkgdesc='Nose plugin to facilitate randomized unit testing'
arch=(any)
url='https://github.com/xlwings/nose-random'
license=(MIT)
depends=(python-nose)
makedepends=(python-setuptools)
source=("https://github.com/xlwings/nose-random/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('528b1c9396cfa415741afaad60ecde695a657c9364dc01240050c747192f5148')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
