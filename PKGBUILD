# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname='python-jax'
pkgver=0.3.16
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
source=('git+https://github.com/google/jax.git')
md5sums=('SKIP')


pkgver() {
    cd $srcdir/jax
    git describe --match 'jax-*' | sed 's/^jax-v//;s/-.*$//'
}

prepare() {
    cd $srcdir/jax
    git checkout "jax-v$pkgver"
}

package() {
    cd $srcdir/jax
    python -m pip install \
        --root $pkgdir \
        --ignore-requires-python \
        .
}
md5sums=('SKIP')
