# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-pscript
pkgver=0.7.1
pkgrel=1
pkgdesc="Python to JavaScript compiler"
arch=('any')
url="https://pscript.readthedocs.io"
license=('BSD')
depends=(python)
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/flexxui/pscript/archive/v${pkgver}.tar.gz
)
sha256sums=(
    8539caefe6b8f97f0f80fccb57076c9a6a7fef4773dc039f3a0286c8bc962fff
)

build() {
    cd "pscript-${pkgver}"
    python setup.py build
}

package() {
    cd "pscript-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
