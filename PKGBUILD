# Maintainer: Yuuki Rika <yvvki@duck.com>

_name=stdl
pkgname=python-${_name}
pkgver=0.5.6
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
b2sums=('d0230886a1a5e3cb734165400efdf42ca30b67057e7a2cca76bfde36ef2feb02b238ce7f8a9d26772365a03c7d36ca8e8939f3a68e4b50516dd50efbce06244f')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
