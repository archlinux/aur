# Maintainer: Yuuki Rika <yvvki@duck.com>

_name=stdl
pkgname=python-${_name}
pkgver=0.6.0
pkgrel=1
pkgdesc='Extended Python Standard Library'
arch=(any)
url='https://github.com/zigai/stdl'
license=(MIT)
depends=(
  python-yaml
  python-dateutil
  python-toml
  python-tqdm
)
makedepends=(
  'python-setuptools'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('e106da4b1b31e8329971251905aee13ee25710096e5aaa26e7057b1e2c77fc4b36a0c2ff3274129c1d6859c75a7ebe67240275e3a39cbf18f1a639977d3c9b39')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
