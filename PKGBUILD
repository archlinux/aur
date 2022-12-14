# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.1
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('absl-py'
         'python'
         'python-jaxlib'
         'python-numpy'
         'python-opt_einsum')
makedepends=('python-pip')
source=("jax-${pkgver}.tar.gz::https://github.com/google/jax/archive/refs/tags/jax-v${pkgver}.tar.gz")
sha256sums=('27d74d95f84af0303813456900e5b7604e5025742adff1f09df16e508424a8a0')

package() {
    cd $srcdir/jax-jax-v$pkgver
    pip --no-python-version-warning -v \
        install --ignore-installed --no-deps --root $pkgdir .
}
