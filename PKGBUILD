# Maintainer: Arcticzomb <your.email@example.com>
pkgname=mc-server-manager-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd service manager for Minecraft servers with screen support"
arch=('any')
url="https://github.com/Arcticzomb/mc-server-manager-systemd"
license=('GPL-3.0-or-later')
depends=('systemd' 'screen' 'java-runtime')
optdepends=('java-runtime-headless: headless Java runtime for servers')
backup=('usr/lib/systemd/system/minecraft@.service')
install=${pkgname}.install
source=(
    "minecraft@.service::https://raw.githubusercontent.com/Arcticzomb/mc-server-manager-systemd/main/minecraft@.service"
    "README.md::https://raw.githubusercontent.com/Arcticzomb/mc-server-manager-systemd/main/README.md"
    "LICENSE::https://raw.githubusercontent.com/Arcticzomb/mc-server-manager-systemd/main/LICENSE"
)
sha256sums=('e2d799c000adb830f24d945879a87a62e18b1e06f989bdbb0bdc11cf3fb94a83'
            'a500e23343193dc4a9a2bd52256f0d61d489d6bd517100b00fda4f54dc01e39b'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    # Install systemd service file
    install -Dm644 "${srcdir}/minecraft@.service" \
        "${pkgdir}/usr/lib/systemd/system/minecraft@.service"
    
    # Install documentation
    install -Dm644 "${srcdir}/README.md" \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
