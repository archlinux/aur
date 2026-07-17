# Maintainer: AndroidHyper <iuseopensusebtw@gmail.com>
pkgname=superinstall-bin
pkgver=1.5
pkgrel=1
pkgdesc="A security-focused package manager alternative to paru and yay (Pre-compiled binaries)"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/AndroidHyperOfficial/superinstall-aur-helper"
license=('GPL-3.0')
depends=('pacman' 'git' 'curl' 'gnupg' 'glibc')
provides=('superinstall')
conflicts=('superinstall')

source_x86_64=("superinstall-x86_64::https://github.com/AndroidHyperOfficial/superinstall-aur-helper/releases/download/v${pkgver}/superinstall-x86_64")
source_aarch64=("superinstall-arm64::https://github.com/AndroidHyperOfficial/superinstall-aur-helper/releases/download/v${pkgver}/superinstall-arm64")
source_i686=("superinstall-386::https://github.com/AndroidHyperOfficial/superinstall-aur-helper/releases/download/v${pkgver}/superinstall-386")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_i686=('SKIP')

package() {
    local _arch_bin="superinstall-x86_64"
    if [ "$CARCH" = "aarch64" ]; then
        _arch_bin="superinstall-arm64"
    elif [ "$CARCH" = "i686" ]; then
        _arch_bin="superinstall-386"
    fi

    install -Dm755 "${srcdir}/${_arch_bin}" "${pkgdir}/usr/bin/superinstall"
}
