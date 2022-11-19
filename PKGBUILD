# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>

pkgname=python38-jaraco.functools
pkgver=3.5.2
pkgrel=1
pkgdesc='Functools like those found in stdlib'
arch=('any')
url='https://github.com/jaraco/jaraco.functools'
license=('MIT')
depends=('python38-more-itertools')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest' 'python38-jaraco.classes')
conflicts=('python38-jaraco')
replaces=('python38-jaraco')
source=("https://files.pythonhosted.org/packages/source/j/jaraco.functools/jaraco.functools-$pkgver.tar.gz")
sha512sums=('3f67d151f4f6553b3e560b0e6ab71cf726d6c8f36ef5e9f69b6325605547797e19a3f9eb1331cf332db498538953ccaeb75820528e6599fd7cf125abdc073e69')

build() {
  cd jaraco.functools-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd jaraco.functools-$pkgver
  pytest
}

package() {
  cd jaraco.functools-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}