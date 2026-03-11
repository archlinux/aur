# Maintainer: DonutsDelivery
pkgname=sysclean-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="System maintenance and package dependency manager for Linux (GTK4 + Rust)"
arch=('x86_64')
url="https://github.com/DonutsDelivery/Smart-Cleaner"
license=('MIT')
depends=('gtk4' 'libadwaita')
provides=('sysclean')
conflicts=('sysclean')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DonutsDelivery/Smart-Cleaner/releases/download/v${pkgver}/sysclean-x86_64.tar.gz")
sha256sums=('3b2467ee7d32f89136d64ff18056b37bb88b4085323e6f967e1d36e8e58b16f1')

package() {
    install -Dm755 "${srcdir}/sysclean" "${pkgdir}/usr/bin/sysclean"

    # Icon
    install -Dm644 "${srcdir}/sysclean.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sysclean.svg" 2>/dev/null || true

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/sysclean.desktop" << DESKTOP
[Desktop Entry]
Type=Application
Name=SysClean
GenericName=Package Manager
Comment=System maintenance and package dependency manager
Exec=sysclean
Icon=sysclean
Terminal=false
Categories=System;PackageManager;
Keywords=package;dependency;clean;maintenance;cache;orphan;
StartupNotify=true
DESKTOP
}
