# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm
pkgrel=1
pkgver=1.3
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://src.clttr.info/rwa/${pkgname}/archive/${pkgver}.tar.gz")
conflicts=('gmni-git' 'cgmnlm-git')
optdepends=('xdg-utils')
depends=('bearssl')
makedepends=('scdoc')
sha256sums=('34f738e68ea63f1d89683d4d418ee36fb5cbef366b2efae4369dcfa48c0195cb')

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
