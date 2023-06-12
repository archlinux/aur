# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-peft
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc='State-of-the-art Parameter-Efficient Fine-Tuning.'
arch=('any')
url='https://github.com/hugginface/peft'
license=('Apache')
groups=('hugginface')
depends=(
    'python-accelerate'
    'python-numpy'
    'python-psutil'
    'python-pytorch'
    'python-safetensors'
    'python-transformers'
    'python-yaml'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/huggingface/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=()

build() {
    cd $_pkgname-$pkgver
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/$_pkgname-$pkgver-py3-*-*.whl
}
sha256sums=('2e21b0e410af0378ae3b553a47f7477e81e5ec00d9b0473219afbe24aeba9dc5')
