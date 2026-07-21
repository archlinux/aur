# Maintainer: Noel Knubel <skaredogged97@pm.me>
pkgname=discord-flatpak-rpc-bridge
pkgver=1.0.1
pkgrel=1
pkgdesc="Bridge for Discord Native-to-Flatpak RPC"
arch=('any')
url="https://github.com/Arcitec/discord-flatpak-rpc-bridge"
license=('GPL-2.0-only')
depends=('systemd')

source=("https://github.com/Arcitec/discord-flatpak-rpc-bridge/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('657974db28aedb3efb8143dcd82baa6caa6dc13da0b6f8566a6d1bc49a7cc858')

package() {
    local src_folder="${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/lib/systemd/user"

    # Install the unit files from the extracted subdirectory
    install -m 644 "${src_folder}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -m 644 "${src_folder}/${pkgname}.socket" "${pkgdir}/usr/lib/systemd/user/${pkgname}.socket"
}
