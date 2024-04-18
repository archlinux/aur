# Maintainer: Groctel <aur@taxorubio.com>

_name=moderngl-window

pkgname=python-moderngl-window
pkgver=2.4.6
pkgrel=1
pkgdesc="A utility library for ModernGL making window creation and resource loading simple."

arch=("any")
license=("MIT")
url="https://github.com/moderngl/moderngl-window"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('bef9eaece117d2205609a62658c6195c65df2bb65f1f64825ada101d335dd4d71623fa3d155ff891d9d3f03e741d5132f0f53041fefeb329cd742135ca5dd9a2')

depends=(
    "python-moderngl"
    "python-numpy"
    "python-pillow"
    # AUR dependencies
    "python-pyglet"
    "python-pyrr"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
)

build () {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
