# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=markdown-it-py
pkgname=python38-$_pkgname
pkgver=2.1.0
pkgrel=1
pkgdesc='Python 3.8 port of markdown-it. Markdown parsing, done right!'
arch=('any')
url='https://github.com/executablebooks/markdown-it-py'
license=('MIT')
depends=('python38-mdurl')
optdepends=('python38-mdit_py_plugins: core plugins')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel')
checkdepends=('python38-pytest' 'python38-pytest-regressions' 'python38-pytest-benchmark' 'python38-psutil' 'python38-mdit_py_plugins' 'python38-linkify-it-py')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('04e90538c8693f795aed2ed0a5bef4eaf0c12fac32cc0c2049c563e974b229940b9ceaea849ce86fa9804ccdd7be93145f3b6fc8d0774e96fafa0484368d0a88')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build
}

check() {
  cd $_pkgname-$pkgver

  python3.8 -m pytest
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
