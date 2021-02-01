# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-jaxlib
pkgver=0.1.59
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
md5sums=('0224b6654ec87d5bbbf0ca51f6b5e15a')

build() {
    cd jax-jaxlib-v$pkgver
    build/build.py --enable_march_native
}

package() {
    cd jax-jaxlib-v$pkgver
    pip install dist/*.whl
}
