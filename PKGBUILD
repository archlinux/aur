# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm
pkgrel=1
pkgver=1.4
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://src.clttr.info/rwa/${pkgname}/archive/${pkgver}.tar.gz")
conflicts=('gmni-git' 'cgmnlm-git')
optdepends=('xdg-utils')
depends=('bearssl')
makedepends=('scdoc')
sha256sums=('54dcd0dc807462dc1e72289bf17bebe87f714a8744e78581d0691e7a475a49b2')

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
