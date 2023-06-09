# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-patio
_pkgname=${pkgname#python-}
pkgver=0.0.0
_pkgver=f65bd652719f0dd1b7926014059b7970c6b95b33
pkgrel=1
pkgdesc="Python Asynchronous Task for AsyncIO core library"
arch=('any')
url="https://github.com/patio-python/patio"
license=('MIT')
groups=()
depends=('python-typing_extensions')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/patio-python/patio/archive/$_pkgver.tar.gz")
sha256sums=('e6219bc987e3544573784c3d25581b56e723176e6e285cda52396d224b40c3e8')

build() {
    cd ${_pkgname}-${_pkgver}
    python -m build -n -w
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        ${_pkgname}-${_pkgver}/dist/${_pkgname}-*.whl
}
