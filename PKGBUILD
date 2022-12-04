# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=5.1.2
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('python-numpy' 'python-build' 'python-installer')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('6b80605bdc6663776011c1246695c42659af8a2b91262f1e3397f4b366834f8779324f0bab609cb9918a06e466731286dd824100edcf44b253022e88a85dba3c')

build() {

    cd SpiceyPy-$pkgver

    python -m build --wheel --no-isolation

}

package() {

    cd SpiceyPy-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
