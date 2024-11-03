# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-triton
_pkgname=${pkgname#python-}
pkgver=3.1.0
pkgrel=1
pkgdesc='Triton compiler'
arch=('x86_64')
url='https://github.com/openai/triton'
license=('MIT')
groups=('openai')
depends=()
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
_wheel="triton-3.1.0-cp312-cp312-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
noextract=($_wheel)
source=("$_wheel::https://files.pythonhosted.org/packages/78/eb/65f5ba83c2a123f6498a3097746607e5b2f16add29e36765305e4ac7fdd8/$_wheel")
sha256sums=('c8182f42fd8080a7d39d666814fa36c5e30cc00ea7eeeb1a2983dbb4c99a0fdc')

package() {
    python -m installer --compile-bytecode=1 --destdir=$pkgdir $srcdir/$_wheel
}
