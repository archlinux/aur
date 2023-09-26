# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>
# Contributor: yochananmarqos

pkgname=python-tmdbsimple
_name=${pkgname#python-}
pkgver=2.9.1
pkgrel=2
pkgdesc="A wrapper for The Movie Database API v3"
arch=('any')
url="https://github.com/celiao/tmdbsimple"
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5aca27030b9fd4af4df00c4850d0843729b0c3603fe1315d1c58635d185c222c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
