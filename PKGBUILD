# Maintainer: Vando <vando.02800@tutamail.com>
pkgname=anisocial-desktop-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Desktop-App für AniSocial.de – Die Anime-Community"
arch=('x86_64')
url="https://github.com/VandoOmi/AniSocialDesktop"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
provides=('anisocial-desktop')
conflicts=('anisocial-desktop')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/anisocial-desktop-${pkgver}.pacman")
sha256sums=('04e83283b9533355ebe17b5a1abfc0ee04ff2b464db5beb52317bd45de5cede1')

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"

    # Remove pacman metadata files
    rm -f "${pkgdir}"/.INSTALL "${pkgdir}"/.MTREE "${pkgdir}"/.PKGINFO "${pkgdir}"/.BUILDINFO "${pkgdir}"/.CHANGELOG

    # Fix permissions
    chmod -R g-w "${pkgdir}"
}
