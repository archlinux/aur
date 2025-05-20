# Maintainer: Yuuki Rika <yvvki@duck.com>

_name=stdl
pkgname=python-${_name}
pkgver=0.6.1
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
b2sums=('d28a9af68e6734356a16640379ecd57ccac0b34b4268fb6386f98131103ad1d5c26984abb1b132056f6a75b68cea534888385879578181c0f02597d025683635')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
