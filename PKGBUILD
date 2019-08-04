# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jax
pkgver=0.1.39
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
             'python'
             'python-numpy'
             'python-protobuf'
             'python-six')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/97/0d/00779b66ee6b8c10b2ece1eeba9ff1c64b1289a71d60e1bbe68f4db2a702/jax-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/87/2b/cf0f0d5bc1229b410544b694c27b4d76f3dc4297331df6515f3e069afc9a/jaxlib-0.1.22-cp37-none-manylinux1_x86_64.whl")
md5sums=('fdf45749383125326188b4e4d657823e'
         '34ba18e09a55bb60aa0bd8af6f9ca6e3')

package() {
    pip install \
        --ignore-requires-python \
        --root=$pkgdir \
        "$srcdir/jax-${pkgver}" \
        "$srcdir/jaxlib-0.1.22-cp37-none-manylinux1_x86_64.whl" \
        "opt_einsum"
}
