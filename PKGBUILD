# Maintainer: René Wagner <rwagner@rw-net.de>

pkgname=cgmnlm
pkgrel=1
pkgver=1.5
pkgdesc="colorful gemini line mode client - fork of gmni"
url="https://sr.ht/~rwa/gemini-clients"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL3')
source=("${pkgname}::git+https://git.sr.ht/~rwa/cgmnlm#tag=${pkgver}")
conflicts=('gmni' 'gmni-git' 'cgmnlm-git')
optdepends=('xdg-utils')
depends=('bearssl')
makedepends=('scdoc')
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"

    mkdir -p build && cd build
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
