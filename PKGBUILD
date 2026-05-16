# Maintainer: Vando <vando.02800@tutamail.com>
pkgname=anisocial-desktop-bin
pkgver=0.1.2
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
sha256sums=('SKIP')

package() {
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.pacman" -C "${pkgdir}/"

    # Remove pacman metadata files
    rm -f "${pkgdir}"/.INSTALL "${pkgdir}"/.MTREE "${pkgdir}"/.PKGINFO "${pkgdir}"/.BUILDINFO "${pkgdir}"/.CHANGELOG

    # Fix permissions
    chmod -R g-w "${pkgdir}"
}
