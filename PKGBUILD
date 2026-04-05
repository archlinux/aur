# Maintainer: Luis Hernandez <luishernandezgarrido@gmail.com>
pkgname=open-os-cli-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Terminal emulator with private, local AI powered by Ollama"
arch=('x86_64')
url="https://open-os.com"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libnotify')
options=('!strip' '!debug')
provides=('open-os-cli')
conflicts=('open-os-cli')
source=("${pkgname}-${pkgver}.pacman::https://github.com/luishg/open-os-cli/releases/download/v${pkgver}/open-os-cli-${pkgver}.pacman")
sha256sums=('c0db949e493acdbed50a573470ea6b7bdeea2dd6c3b3d2f376ce5add3fc286b7')
noextract=("${pkgname}-${pkgver}.pacman")

package() {
    bsdtar -xf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
    # Remove pacman-specific metadata
    rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.BUILDINFO"
}
