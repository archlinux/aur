# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=5.0.1
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('python-numpy' 'python-build' 'python-installer')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('9765be83df5d71a828a2a4d390feeb65ca2350d5965ccfdd876a44cd8e6d839b5c51340cd9a3537f0de330043f644e12e8904b5ac3f58f6f2fc74f2ea2742acf')

build() {

    cd SpiceyPy-$pkgver

    python -m build --wheel --no-isolation

}

package() {

    cd SpiceyPy-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
