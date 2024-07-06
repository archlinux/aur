# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.4.32
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy<2.0.0' 'cython' 'ta-lib' 'python-build')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/archive/refs/tags/TA_Lib-$pkgver.tar.gz")
sha256sums=('34b03fa32465632b5eabdd2ea0278abf8270b0b07512d02e1e35443a09689abe')

build() {
    cd "$srcdir"/ta-lib-python-TA_Lib-$pkgver
    python -m build --wheel --no-isolation
}

package_python-ta-lib() {
    depends=('python-numpy' 'ta-lib')
    optdepends=('cython')

    cd $srcdir/ta-lib-python-TA_Lib-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
