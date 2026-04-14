# Maintainer: Stephane Wetterwald <stephane@wetterwald.eu>
pkgname=cheatbind
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland keyboard shortcuts overlay — parses compositor config and displays a styled cheatsheet"
arch=('any')
url="https://github.com/Xhelliom/cheatbind"
license=('MIT')
depends=(
    'python>=3.11'
    'python-gobject'
    'gtk4'
    'gtk4-layer-shell'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
