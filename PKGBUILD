# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=pytest-regressions
pkgname=python38-$_pkgname
pkgver=2.4.1
pkgrel=1
pkgdesc='Pytest plugin for regression testing'
arch=('any')
url='https://github.com/ESSS/pytest-regressions'
license=('MIT')
depends=('python38-pytest' 'python38-pytest-datadir' 'python38-yaml')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('391ddeeeb7a245a86fed72b47bc05804e6d7cd3d0f58bb0653913c59c3f043176560b6b413369c5989a09a3e905177debbbc814ebed9fcb57f2a7eca40334120')

build() {
  cd $_pkgname-$pkgver

  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python3.8 -m build -nw
}

package() {
  cd $_pkgname-$pkgver

  python3.8 -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
