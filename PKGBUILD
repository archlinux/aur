# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-userspacefs
_name=${pkgname#python-}
pkgver=2.0.5
pkgrel=4
pkgdesc="Cross-platform user-space file systems for Python"
arch=('any')
url="https://thelig.ht/code/userspacefs"
license=('GPL3')
depends=('python-fusepyng')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5d6f5ffa6d39488f1c7437c5eaae8fabf4916caceab483a3173a18e6789b186c')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
