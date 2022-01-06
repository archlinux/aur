# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm
pkgrel=1
pkgver=1.2
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://src.clttr.info/rwa/${pkgname}/archive/${pkgver}.tar.gz")
conflicts=('gmni-git' 'cgmnlm-git')
optdepends=('xdg-utils')
depends=('bearssl')
makedepends=('scdoc')
sha256sums=('372da27dc5b9ebbf752d95b14f1746e2614ed1dc4a0ce55ed866dda4da27b276')

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
