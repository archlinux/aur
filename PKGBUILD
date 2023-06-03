# Maintainer: Core_UK <dev@coredev.uk>

pkgname=cider-bin
_pkgname=cider
pkgver=1.6.1
pkgrel=3
pkgdesc="Project Cider. An open-source Apple Music client built from the ground up with Vue.js and Electron. Installed using the debian release builds the CI."
arch=("x86_64")
url="https://github.com/ciderapp/${_pkgname}.git"
license=(AGPL3)
depends=(gtk3 nss alsa-lib libxcrypt-compat)
optdepends=('libnotify: Playback notifications')
provides=(cider)
conflicts=(cider)
source_x86_64=("https://github.com/ciderapp/${_pkgname}/releases/download/v${pkgver}/cider_${pkgver}_amd64.deb")
sha256sums_x86_64=('5239ac373e4dd8cabee92d3b2b9bab42850213a8d30b7d0cada41c20317b5d6a')

package() {
    # Extract package data
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}/

    # Symlink the binary
    install -d "$pkgdir/usr/bin/"
    ln -sf "/opt/Cider/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
