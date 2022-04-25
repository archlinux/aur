# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=imgui
pkgname=python-$_name
pkgver=1.4.1 
pkgrel=1
pkgdesc='Cython-based Python bindings for dear imgui'
arch=(any)
url='https://github.com/pyimgui/pyimgui'
license=('MIT')
depends=(python)
makedepends=(cython python-build python-click python-glfw python-installer python-opengl python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('012fd8d581171bd04ebfa649ca92c7f382a2806c7027bc7c31c8b39899899e7d')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
