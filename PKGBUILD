# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
pkgname=python-anytree
_name=${pkgname#python-}
pkgver=2.9.0
pkgrel=1
pkgdesc="Simple, lightweight and extensible Tree data structure."
arch=('any')
url="https://anytree.readthedocs.io/"
license=('Apache')
depends=('python-six')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('06f7bc294293da2755f4699cc5da5c92d9182a5cfae2842c83fb56f02bd427c8')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
