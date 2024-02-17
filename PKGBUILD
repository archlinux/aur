# Maintainer: Jim Dee Kepeler <jimdee at github dot comm>
pkgname=scrolltext
_name=${pkgname#python-}
pkgver=0.0.6
pkgrel=1
pkgdesc="Simple terminal application for scrolling text."
arch=('any')
url="https://github.com/jimdeekepler/python-scrolltext"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a2c13abf8ed3d9198458dfcb1f10244b3749ef7420edae800f4e88963e1faac2')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
