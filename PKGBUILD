# Maintainer: Jim Dee Kepeler <jimdee at github dot comm>
pkgname=scrolltext
_name=${pkgname#python-}
pkgver=0.0.8
pkgrel=1
pkgdesc="Simple terminal application for scrolling text."
arch=('any')
url="https://github.com/jimdeekepler/python-scrolltext"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ed0a7cc7ed2b5ff08bb8d9ae275141cab85432d449aca2de346a8439c9ce05d6')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
