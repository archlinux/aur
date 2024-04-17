# Maintainer: Jim Dee Kepler <jimdee at github dot comm>
pkgname=scrolltext
_name=${pkgname#python-}
pkgver=0.0.10
pkgrel=1
pkgdesc="Simple terminal application for scrolling text."
arch=('any')
url="https://github.com/jimdeekepler/python-scrolltext"
license=('GPL-3.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6de8631a78dd4f05f6c246712c7b55f30590042b6b95ac0906a2d1f45f076312')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
