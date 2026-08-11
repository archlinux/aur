# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=python-client
pkgname="python-appium-$_pkgname"
pkgver=6.0.0
pkgrel=1
pkgdesc="Python language bindings for Appium"
arch=('any')
url="https://github.com/appium/python-client"
license=('Apache-2.0')
depends=('python' 'python-selenium' 'python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'python-hatchling')
# checkdepends=('python-pytest' 'python-httpretty' 'python-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('deaeea333d865d72e6c283b289d3343ea027c2b571d3c52e08e56dd7ff32eef1')

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
