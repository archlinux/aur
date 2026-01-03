# Maintainer: crl <crl18039102576@126.com>

pkgname=python-nvtx
_name=${pkgname#python-}
pkgver=0.2.14
pkgrel=1
pkgdesc="Python NVTX - Python code annotation library"
url="https://github.com/NVIDIA/NVTX"
arch=('x86_64')
license=('Apache-2.0')
depends=('python' 'cython')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('12945242a31bde70b1f15cae867f8706bdff290e2f808a11738e03ebefdf847f')


build() {
    cd "$srcdir/nvtx-$pkgver"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/nvtx-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
