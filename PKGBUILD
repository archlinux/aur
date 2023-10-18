# Maintainer: piernov <piernov@piernov.org>

pkgname=python-setuptools-changelog-shortener
pkgver=0.2.0
pkgrel=1
pkgdesc="Setuptools plugin to allow shortening the number of changelog entries to use for the long_description metadata in Python packages."
arch=('x86_64')
url="https://github.com/fschulze/setuptools-changelog-shortener"
license=('MIT')
depends=('python-setuptools' 'python-tomli')
makedepends=('python-wheel')
source=("setuptools-changelog-shortener-${pkgver}.tar.gz::https://github.com/fschulze/setuptools-changelog-shortener/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('3cd96aa53b8d5d6744615353d6e65f9c')

build() {
  cd setuptools-changelog-shortener-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd setuptools-changelog-shortener-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
