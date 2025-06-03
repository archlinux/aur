# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-lzstring
_name=${pkgname#python-}
pkgver=1.0.4
pkgrel=4
pkgdesc='String encoding/decoding of binary data'
arch=('any')
url="https://github.com/gkovacs/lz-string-python"
license=('BSD')
depends=(python-future)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/l/lzstring/lzstring-$pkgver.tar.gz)
sha256sums=('1afa61e598193fbcc211e0899f09a9679e33f9102bccc37fbfda0b7fef4d9ea2')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
