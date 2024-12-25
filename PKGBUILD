# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.5.1
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy<3.0.0' 'cython' 'ta-lib' 'python-build')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/archive/refs/tags/TA_Lib-$pkgver.tar.gz")
sha256sums=('14490c550b806a4697118446530d5a3b4b770939651aa5b14c067d4c1fbb96cf')

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
