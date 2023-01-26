# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.4.2
pkgrel=2
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
sha256sums=('1f3beb3260d06ae5f7c9916e73f1aa8d97f0e40306885abe95ec3fd91a4885a5')

package() {
    cd $srcdir/jax-jax-v$pkgver
    pip --no-python-version-warning -v \
        install --ignore-installed --no-deps --root $pkgdir .
}
