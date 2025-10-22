# Maintainer: Margot PREGO <mopigames@proton.me>
pkgname=sayo-driver
pkgver=1.0.0
pkgrel=1
pkgdesc="Sayo Driver - Flutter application"
arch=('x86_64')
license=('mit')
depends=('gtk3' 'libayatana-appindicator')
source=()
sha256sums=()

package() {
    # Create installation directories
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"

    # Copy the application files
    cp -r "${startdir}/sayo_driver/"* "${pkgdir}/opt/${pkgname}/"

    # Set proper permissions for the executable
    chmod 755 "${pkgdir}/opt/${pkgname}/sayo_driver"

    # Create symlink in /usr/bin
    ln -s "/opt/${pkgname}/sayo_driver" "${pkgdir}/usr/bin/sayo-driver"

    # Install desktop file
    install -Dm644 "${startdir}/sayo-driver.desktop" "${pkgdir}/usr/share/applications/sayo-driver.desktop"
}
