# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=mdit-py-plugins
pkgname=python38-mdit_py_plugins
pkgver=0.3.1
pkgrel=1
pkgdesc='Collection of core plugins for markdown-it-py'
arch=('any')
url='https://github.com/executablebooks/mdit-py-plugins'
license=('MIT')
depends=('python38-markdown-it-py')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core')
checkdepends=('python38-pytest' 'python38-pytest-regressions')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('a934953e95eba04f5c1626d8256fed53cbbb26e35d816b41b7aaf968b452e3bfaa99e3008009dbdd8d9e7c89497916916c2cc1fabbecb735624231cafee864ea')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build -wn
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
