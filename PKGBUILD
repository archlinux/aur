# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nvtx
_name=${pkgname#python-}
pkgver=0.2.13
pkgrel=1
pkgdesc="Python NVTX - Python code annotation library"
url="https://github.com/NVIDIA/NVTX"
arch=('any')
license=('Apache-2.0')
depends=('python' 'cython')
makedepends=('python-setuptools')
_nvtx_commit=2210002a22bf865e6718d650af59b938cecd1d90
source=("nvtx.tar.gz::$url/archive/$_nvtx_commit.tar.gz")
sha256sums=('afc0fe0d1bbbba574d07650153ed2f736709658f09f5a9c342a7371a616a4538')


build() {
    cd "$srcdir/NVTX-$_nvtx_commit/python"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/NVTX-$_nvtx_commit/python"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
