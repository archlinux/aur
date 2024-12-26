# Maintainer: Jim Dee Kepler <jimdee at github dot comm>
pkgname=scrolltext
_name=${pkgname#python-}
pkgver=0.0.11
pkgrel=2
pkgdesc="Simple terminal application for scrolling text."
arch=('any')
url="https://github.com/jimdeekepler/python-scrolltext"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a1045ae423c7e34d5e62fab9f0082df18ff17bdbba73604d4835785035b5db90')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
