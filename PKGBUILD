# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-meta
pkgver=0.4.1
pkgrel=1
pkgdesc="Python Meta Programming"
arch=('any')
url="https://github.com/srossross/Meta"
license=('BSD')
depends=(python)
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/srossross/Meta/archive/${pkgver}.tar.gz
)
sha256sums=(
    9d918bd5277ce4f41f9ffe25584928cc04001ca2aae25d1f7f1dac87e0ba398c
)

build() {
    cd "Meta-${pkgver}"
    python setup.py build
}

package() {
    cd "Meta-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 license.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
