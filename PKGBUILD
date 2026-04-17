# Maintainer: Luis Hernandez <luishernandezgarrido@gmail.com>
pkgname=open-os-cli-bin
pkgver=0.7.0
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
sha256sums=('a7ea35f2804bd19cd444ef840de9eaab55aabdf74ac7ef13d6bfbc36d4501cc6')
noextract=("${pkgname}-${pkgver}.pacman")

package() {
    bsdtar -xf "${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"
    # Remove pacman-specific metadata
    rm -f "${pkgdir}/.INSTALL" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO" "${pkgdir}/.BUILDINFO"
}
