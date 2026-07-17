# Maintainer: AndroidHyper <iuseopensusebtw@gmail.com>
pkgname=superinstall-bin
pkgver=1.8
pkgrel=1
pkgdesc="A security-focused package manager alternative to paru and yay (C & Raylib Port - Binary)"
arch=('x86_64')
url="https://github.com/AndroidHyperOfficial/superinstall-aur-helper"
license=('GPL-3.0')
depends=('pacman' 'git' 'curl' 'gnupg' 'glibc' 'raylib' 'libx11')
provides=('superinstall')
conflicts=('superinstall')
options=(!debug !strip)

# Downloads the pre-compiled binary and the source tag archive (to grab the font file)
source=(
    "superinstall::https://github.com/AndroidHyperOfficial/superinstall-aur-helper/releases/download/${pkgver}V/superinstall"
    "https://github.com/AndroidHyperOfficial/superinstall-aur-helper/archive/refs/tags/${pkgver}V.tar.gz"
)
sha256sums=('SKIP' 'SKIP')

package() {
    # 1. Install the pre-compiled executable binary
    install -Dm755 "${srcdir}/superinstall" "${pkgdir}/usr/bin/superinstall"
    
    # 2. Extract and install the font file from the source archive
    install -Dm644 "${srcdir}/superinstall-aur-helper-${pkgver}V/fonts/UbuntuMonoNerdFont-Regular.ttf" "${pkgdir}/usr/share/fonts/TTF/UbuntuMonoNerdFont-Regular.ttf"
}