# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=python-client
pkgname="python-appium-$_pkgname"
pkgver=5.3.1
pkgrel=1
pkgdesc="Python language bindings for Appium"
arch=('any')
url="https://github.com/appium/python-client"
license=('Apache-2.0')
depends=('python' 'python-selenium' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling')
# checkdepends=('python-pytest' 'python-httpretty' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('addcdf6d3ee828eeba20a2abb66a574a06c8224b406050d0ae3c19827c407f3a')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_pkgname-$pkgver"
#   pytest
# }

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
