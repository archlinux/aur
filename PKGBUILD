# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=dearpygui
pkgname=python-$_name
pkgver=1.6.2
pkgrel=1
pkgdesc='A fast and powerful Graphical User Interface Toolkit for Python with minimal dependencies'
arch=(x86_64)
url='https://github.com/hoffstadt/DearPyGui'
license=('MIT')
depends=(python)
makedepends=(python-installer python-wheel)
_py=cp310
source=("https://files.pythonhosted.org/packages/$_py/${_name::1}/$_name/${_name//-/_}-$pkgver-$_py-$_py-manylinux1_x86_64.whl")
sha256sums=('SKIP')

package() {
    python -m installer --destdir="$pkgdir" *.whl
    install -Dm644 "$_name-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
