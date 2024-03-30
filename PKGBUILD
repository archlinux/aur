# Maintainer: Jim Dee Kepler <jimdee at github dot comm>
pkgname=scrolltext
_name=${pkgname#python-}
pkgver=0.0.9
pkgrel=1
pkgdesc="Simple terminal application for scrolling text."
arch=('any')
url="https://github.com/jimdeekepler/python-scrolltext"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c81e617cce00ea2a13e58fe833a3a128a2b3156c99a698993eb4c7a7a3f8da4a')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
