# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=imgui
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc='Cython-based Python bindings for dear imgui'
arch=(any)
url='https://github.com/pyimgui/pyimgui'
license=('MIT')
depends=(python)
makedepends=(cython python-build python-click python-glfw python-installer python-opengl python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('2fbdb8eed3b8dbd7ea98af9e4c1c6582b0bc4da942a258de16333d8c653d67e1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
