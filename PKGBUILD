# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sebastian Weiss <dl3yc at darc dot de>

pkgname=python-polt
_pkg="${pkgname#python-}"
pkgver=1.1.0
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=(any)
url="https://gitlab.com/nobodyinperson/python3-polt"
license=(GPL-3.0-or-later)
depends=(
    python
    python-click
    python-matplotlib
    python-numpy
    python-scipy
    python-xdgspec)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('cf9861a3bb31775f72925f7fba7fa8b7239007a6d41b4d71c46dfc76c9a0f225')

build() {
    cd "$_pkg-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkg-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
