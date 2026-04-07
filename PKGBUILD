# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=147.0.7727.55
pkgrel=16
pkgdesc="A web browser built for speed, simplicity, and security, with patches for Omarchy (binary package)"
arch=('x86_64' 'aarch64')
url="https://www.chromium.org/Home"
license=('BSD-3-Clause')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('chromium')
conflicts=('chromium' 'omarchy-chromium')

# Architecture-specific sources
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v147.0.7727.55-16/omarchy-chromium-147.0.7727.55-16-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v147.0.7727.55-16/omarchy-chromium-147.0.7727.55-16-aarch64.pkg.tar.zst")
sha256sums_x86_64=('5768a607f4e3b950fc9d4a7fba5a92b3faee3e232ca530daa5bf9d760a213961')
sha256sums_aarch64=('1fc9daa0112e9f2bc08ad5e7e6f3498aa547400199b26ca39f95ff000bf84127')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-147.0.7727.55-16-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
