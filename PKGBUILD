# Maintainer: Berke Oruc <berke@berkeai.com>
# Contributor: Berke Oruc <berke@berkeai.com>

pkgname=broslauncher
pkgver=1.0.7
pkgrel=1
pkgdesc="BrosLauncher - Bros HM-1 CPU Emulator with QEMU"
arch=('x86_64')
url="https://bros.berkeai.com"
license=('MIT')
depends=('python' 'tk' 'qemu-system-x86')
source=('launcher.py'
        'schematic.py'
        'constants.py'
        'broslauncher.desktop'
        'broslauncher.png')
noextract=()
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/broslauncher"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    cat > "${pkgdir}/usr/bin/BrosLauncher" << 'WRAPPER'
#!/bin/bash
exec python3 /usr/share/broslauncher/launcher.py "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/BrosLauncher"

    cp launcher.py "${pkgdir}/usr/share/broslauncher/"
    cp schematic.py "${pkgdir}/usr/share/broslauncher/"
    cp constants.py "${pkgdir}/usr/share/broslauncher/"
    cp broslauncher.desktop "${pkgdir}/usr/share/applications/"
    cp broslauncher.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/broslauncher.png"
}