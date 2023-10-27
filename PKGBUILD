# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
pkgname=python-anytree
_name=${pkgname#python-}
pkgver=2.12.0
pkgrel=1
pkgdesc="Simple, lightweight and extensible Tree data structure."
arch=('any')
url="https://anytree.readthedocs.io/"
license=('Apache')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_name-$pkgver.tar.gz::https://github.com/c0fec0de/anytree/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23732f78dd6647162091d116cdbb82634bbed4ec27e94a8c4de73567c63beeda')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
