# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=6.0.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('python-numpy' 'python-build' 'python-installer' 'python-wheel')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('5ebb4bdbf04cdf5292f44dc36e8ea48c8e1a6cbabdde93d3c942ba8bf97d0df46cc666398acacb32d25455db4692ba7f8fab9064b76de0863502f73602903bae')

build() {

    cd SpiceyPy-$pkgver

    python -m build --wheel --no-isolation

}

package() {

    cd SpiceyPy-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
