# Maintainer: Groctel <aur@taxorubio.com>

_name=moderngl-window

pkgname=python-moderngl-window
pkgver=2.4.5
pkgrel=1
pkgdesc="A utility library for ModernGL making window creation and resource loading simple."

arch=('any')
license=('MIT')
url="https://github.com/moderngl/moderngl-window"

source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('4305951d9753696ad2caa259af52c45eda8e02fee061d45cd364899942d2d00cf9ba23b8193a5a52e249f88da21df260efcd49e5f756f3743fdfbcf70144d405')

depends=(
    'python-moderngl'
    'python-numpy'
    'python-pillow'
    # AUR dependencies
    'python-pyglet'
    'python-pyrr'
)
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
)

build ()
{
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package ()
{
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
