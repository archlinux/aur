# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=sphinx-pytest
pkgname=python38-$_pkgname
pkgver=0.0.5
pkgrel=1
pkgdesc='Helpful pytest fixtures for sphinx extensions'
arch=('any')
url='https://github.com/chrisjsewell/sphinx-pytest'
license=('MIT')
depends=('python38-sphinx' 'python38-pytest')
makedepends=('python38-build' 'python38-installer' 'python38-flit-core' 'python38-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('e1af518cc5535ecacae612f11c7fb1200965a1999d9eb2643ba14b222fc4e93c257ef6600b37b9de4075bf3e5e703db60e7350cd5159fcf4ba21abec28bceb66')

build() {
  cd $_pkgname-$pkgver

  python3.8 -m build -nw
}

#check() {
#  cd $_pkgname-$pkgver
#
#  PYTHONPATH=src python3.8 -m pytest
#}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
