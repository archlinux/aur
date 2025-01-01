# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgbase='python-common-ta-lib'
pkgname=("python-ta-lib")
pkgver=0.5.2
pkgrel=1
pkgdesc="Python wrapper for TA-Lib"
url="https://github.com/TA-Lib/ta-lib-python"
makedepends=('python-setuptools' 'python-numpy<3.0.0' 'cython' 'ta-lib>=0.6.2' 'python-build')
license=('BSD')
arch=('any')
source=("https://github.com/TA-Lib/ta-lib-python/archive/refs/tags/TA_Lib-$pkgver.tar.gz")
sha256sums=('cd9db0df0abd6f7c924e5b80775a1c2a07f4b60f4c682974ee8fccb0357dac6f')

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
