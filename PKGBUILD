# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm
pkgrel=1
pkgver=1.1
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://src.clttr.info/rwa/${pkgname}/archive/${pkgver}.tar.gz")
conflicts=('gmni-git' 'cgmnlm-git')
optdepends=('xdg-utils')
depends=('bearssl')
makedepends=('scdoc')
sha256sums=('57c1937cfce2634a198618074487670b928df73f94323b4355ead2480acc542a')

build() {
    cd "${srcdir}/${pkgname}"

    mkdir -p build && cd build
    # errors? what errors :)
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
