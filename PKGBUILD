# Maintainer: Frédéric Logier <fredix@protonmail.com>
_name=harbor
pkgname=harbor
pkgver=1.0.0
pkgrel=2
epoch=
pkgdesc="Ecash management tool"
arch=('x86_64')
url="https://github.com/HarborWallet/harbor"
license=('MIT')
groups=()
makedepends=()
checkdepends=()
optdepends=()
provides=("${_name}")
conflicts=("${_name}")
replaces=()
backup=()
options=('!lto')
install=
changelog=
source=("${url}/releases/download/v${pkgver}/harbor-ui_${pkgver}_amd64.deb")

noextract=()
sha256sums=("SKIP")
validpgpkeys=()

package() {
    # Create package directory if it doesn't exist
    mkdir -p "$pkgdir"

    # Extract the .deb archive
    cd "$srcdir"
    ar x "${srcdir}/harbor-ui_${pkgver}_amd64.deb"

    # Extract data archive to the package directory
    tar -xf data.tar.zst -C "$pkgdir"

    # Clean up
    rm -f control.tar.zst data.tar.zst debian-binary
}
