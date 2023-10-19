# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
pkgname=python-anytree
_name=${pkgname#python-}
pkgver=2.11.1
pkgrel=1
pkgdesc="Simple, lightweight and extensible Tree data structure."
arch=('any')
url="https://anytree.readthedocs.io/"
license=('Apache')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/c0fec0de/anytree/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c718503882f2438e8484ee37d7698efc868f6fc8edf7bdc86061a82fcb4a8d44')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
