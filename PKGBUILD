# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=5.1.1
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('python-numpy' 'python-build' 'python-installer')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('bc87049cad181815dde87af000e91e82a686e51437eb1646debecbc8e0fef693d2964f0f6b75f5ab712d62a309652f163c292afaf3aecced83339b3e1592409f')

build() {

    cd SpiceyPy-$pkgver

    python -m build --wheel --no-isolation

}

package() {

    cd SpiceyPy-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
