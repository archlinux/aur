# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm
pkgrel=2
pkgver=1.0
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://src.clttr.info/rwa/cgmnlm"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}::https://src.clttr.info/rwa/${pkgname}/archive/${pkgver}.tar.gz")
conflicts=('gmni-git' 'cgmnlm-git')
depends=('bearssl')
makedepends=('git' 'scdoc')
sha256sums=('fbfecea428ef4b938d5d76f48dc708847ae2b2c71c10507543d1ac4660b338d7')

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
