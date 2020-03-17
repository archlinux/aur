# Maintainer: Robert Csordas <xdever@gmail.com>
pkgname=mutagen.io-bin
pkgver=0.11.2
pkgrel=1
epoch=
arch=("i386" "x86_64")
url="https://mutagen.io/"
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
source_x86_64=("https://github.com/havoc-io/mutagen/releases/download/v${pkgver}/mutagen_linux_amd64_v${pkgver}.tar.gz")
source_i386=("https://github.com/havoc-io/mutagen/releases/download/v${pkgver}/mutagen_linux_386_v${pkgver}.tar.gz")
license=('MIT')
md5sums_x86_64=('1a4b89cc6844a3a6a851ee6d6b67ced3')
md5sums_i386=('6994e6ab21e0ea5b2c91f2d3766b8d2e')
pkgdesc="Code synchronization tool for remote development."

prepare () {
    tar -xvf mutagen_linux_*_v${pkgver}.tar.gz
}

package () {
    install -D -m755 ${srcdir}/mutagen ${pkgdir}/opt/mutagen/mutagen
    install -D -m644 ${srcdir}/mutagen-agents.tar.gz ${pkgdir}/opt/mutagen/mutagen-agents.tar.gz
    mkdir -p  ${pkgdir}/usr/bin/
    ln -s /opt/mutagen/mutagen ${pkgdir}/usr/bin/
}
