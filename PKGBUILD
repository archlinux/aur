# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-webruntime
pkgver=0.5.6
pkgrel=1
pkgdesc="Launch HTML5 apps in the browser or a desktop-like runtime."
arch=('any')
url="https://webruntime.readthedocs.io"
license=('BSD')
depends=(python python-dialite)
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/flexxui/webruntime/archive/v${pkgver}.tar.gz
)
sha256sums=(
    f9898617ae2b0d3f81724b89da9e7ae5f6bac39949b41699d05e9ff07e3907c4
)

build() {
    cd "webruntime-${pkgver}"
    python setup.py build
}

package() {
    cd "webruntime-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
