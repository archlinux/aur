# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-shortcutter
pkgver=0.1.20
pkgrel=1
pkgdesc="Easy cross-platform creation of shortcuts supporting virtual and Anaconda environments"
arch=('any')
url="https://github.com/kiwi0fruit/shortcutter"
license=('MIT')
depends=(python)
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/kiwi0fruit/shortcutter/archive/${pkgver}.tar.gz
)
sha256sums=(
    859ddf79a061071544cd4dcb30a77f390c97ed8819d5cf05bec4e564d8ea7b95
)

build() {
    cd "shortcutter-${pkgver}"
    python setup.py build
}

package() {
    cd "shortcutter-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
