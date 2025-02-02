# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-triton
_pkgname=${pkgname#python-}
pkgver=3.2.0
pkgrel=1
pkgdesc='Triton compiler'
arch=('x86_64')
url='https://github.com/openai/triton'
license=('MIT')
groups=('openai')
depends=()
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
_wheel='triton-3.2.0-cp313-cp313-manylinux_2_17_x86_64.manylinux2014_x86_64.whl'
noextract=($_wheel)
source=("$_wheel::https://files.pythonhosted.org/packages/c7/30/37a3384d1e2e9320331baca41e835e90a3767303642c7a80d4510152cbcf/$_wheel")
sha256sums=('e5dfa23ba84541d7c0a531dfce76d8bcd19159d50a4a8b14ad01e91734a5c1b0')

package() {
    python -m installer --compile-bytecode=1 --destdir=$pkgdir $srcdir/$_wheel
}
