# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
pkgname=python-anytree
_name=${pkgname#python-}
pkgver=2.9.2
pkgrel=1
pkgdesc="Simple, lightweight and extensible Tree data structure."
arch=('any')
url="https://anytree.readthedocs.io/"
license=('Apache')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/c0fec0de/anytree/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('998537d344759a6b14fc365c7171eac520ee1284e8580abf32012619f9635c57')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
