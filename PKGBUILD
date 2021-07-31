# $Id$
# Maintainer: Shane Stone <shanewstone at gmail>
pkgname=python-spiceypy
pkgver=4.0.1
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N66) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy"
license=('MIT')
makedepends=('python-numpy')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('43094b6cf922ce25ceea9b9a05299b7ac99d3d5a54f3a2d282d45cc6abac0907397d5ea6581817f86a11911c1e124183b17b28ce54be90db2da58797ee5c5844')

build() {

    cd SpiceyPy-$pkgver

    python setup.py build

}

package() {

    cd SpiceyPy-$pkgver

    python setup.py install --skip-build --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
