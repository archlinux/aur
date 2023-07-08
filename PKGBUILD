# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-telepyth
_pkgname=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc='Telegram notification with IPython magics'
arch=('any')
url='https://github.com/deepmind/chex'
license=('MIT')
groups=()
depends=()
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/daskol/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2850be1af325535d1d0c63186cd1f791bfe63aba611e6c0c68642228915e2c7c')

build() {
    python -m build -nw $_pkgname-$pkgver
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $srcdir/$_pkgname-$pkgver/dist/$_pkgname-*.whl
}
