# Maintainer: NObodyGX <nobodygx@163.com>

pkgname=asciibox
pkgver=0.8.2
pkgrel=1
arch=('x86_64')
pkgdesc='An auxiliary tool to simplify write svgbob and asciidoc'
url='https://github.com/NObodyGX/asciibox'
license=('MIT')
depends=('rust' 'gtk4' 'libadwaita')
makedepends=('git' 'meson' 'ninja')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9410de12fee15c1803496234a6b732ab41ed2543ea9359df83f5d0dd98269645')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    meson setup build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}"
    meson compile
    meson install
}
