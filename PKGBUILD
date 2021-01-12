# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.1.57
pkgrel=1
pkgdesc='Differentiate, compile, and transform Numpy code.'
arch=('x86_64')
url='https://github.com/google/jax/'
license=('Apache')
depends=('python'
         'python-numpy'
         'python-protobuf'
         'python-scipy'
         'python-wheel')
makedepends=('bazel'
             'gcc'
             'python-pip'
             'python-six')
source=("https://github.com/google/jax/archive/jaxlib-v$pkgver.tar.gz")
md5sums=('2a6b1acd4d002c6760138f9fc792b736')

build() {
    cd $srcdir/jax-jaxlib-v$pkgver
    python build/build.py
}

package() {
    cd $srcdir/jax-jaxlib-v$pkgver
    pip instal --prefix $pkgdir dist/*.whl
}
