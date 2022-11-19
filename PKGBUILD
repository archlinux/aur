# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-jaraco.classes
pkgver=3.2.3
pkgrel=1
pkgdesc='Module for classes manipulation'
arch=('any')
url='https://github.com/jaraco/jaraco.classes'
license=('MIT')
depends=('python38-more-itertools')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-enabler' 'python38-pytest-mypy' 'python38-pip')
conflicts=(python38-jaraco)
replaces=(python38-jaraco)
source=("https://files.pythonhosted.org/packages/source/j/jaraco.classes/jaraco.classes-$pkgver.tar.gz")
sha512sums=('73fe80de5c50b553efee6aa51fff98e30e72dcb4167b6056628d3cbbb897e29abde4fa9da79a2b413830d8440055a43ea97ace4daa62853d874419cb36c43fee')

build() {
  cd "$srcdir/jaraco.classes-$pkgver"
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/jaraco.classes-$pkgver"
  python3.8 -m pytest
}

package() {
  cd "$srcdir/jaraco.classes-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
