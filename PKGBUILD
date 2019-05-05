# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-dialite
pkgver=0.5.2
pkgrel=1
pkgdesc="Lightweight pure-Python package to show simple dialogs."
arch=('any')
url="http://dialite.readthedocs.io/"
license=('BSD')
depends=(python)
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/flexxui/dialite/archive/v${pkgver}.tar.gz
)
sha256sums=(
    c730fdba77187a95529c88cf195e35ea8ce70ab012a98ad9b023ac39e93b62cd
)

build() {
    cd "dialite-${pkgver}"
    python setup.py build
}

package() {
    cd "dialite-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
