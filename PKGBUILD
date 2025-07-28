# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=6.0.3
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('python-numpy' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python-numpy')
optdepends=('python-pytest: testing' 'python-pandas: testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andrewannex/spiceypy/archive/v$pkgver.tar.gz")
sha512sums=('29ff2ff6af87dc988a079b1582a46e9e203213d54986bd91f2c849ebe13d6528b3fa988b0916abd8879baeae014921dcc47896833b601ef8e129794cae26f708')

build() {

    cd SpiceyPy-$pkgver

    python -m build --wheel --no-isolation

}

package() {

    cd SpiceyPy-$pkgver

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
