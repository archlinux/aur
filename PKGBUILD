# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.6.7
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy>2.0.0' 'python-numpy<3.0.0' 'cython' 'ta-lib>=0.6.0' 'python-build' 'python-installer')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d24dc12951ebb3469b65eb6f88ade3b1eaeeecea25fcad74b359222cad90e80b')

build() {
    cd "$srcdir"/ta-lib-python-$pkgver
    python -m build --wheel --no-isolation
}

package_python-ta-lib() {
    depends=('python-numpy' 'ta-lib')
    optdepends=('cython')

    cd $srcdir/ta-lib-python-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
