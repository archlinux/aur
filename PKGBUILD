# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nvtx
_name=${pkgname#python-}
pkgver=0.2.12
pkgrel=1
pkgdesc="Python NVTX - Python code annotation library"
url="https://github.com/NVIDIA/NVTX"
arch=('any')
license=('Apache-2.0')
depends=('python' 'cython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('b871fae9b80b004e624b5755291799794287016fa6a0c8fd0fb3255393ae3bc8')


build() {
    cd "$srcdir/nvtx-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/nvtx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
