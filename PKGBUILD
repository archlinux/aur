# Maintainer: A. Klitzing <aklitzing@gmail.com>
_name=typelets
pkgname=python-${_name}
pkgver=1.1
pkgrel=1
pkgdesc="Typelets for Python"
arch=('any')
url="https://pypi.org/project/typelets/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-typing_extensions)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('5fd0a01016402a2f87892ac855241ee2769b7595c7e955acce040c86f71bfb38')

build() {
  cd "$srcdir/${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

