# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=143.0.7499.192
pkgrel=18
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v143.0.7499.192-18/omarchy-chromium-143.0.7499.192-18-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v143.0.7499.192-18/omarchy-chromium-143.0.7499.192-18-aarch64.pkg.tar.zst")
sha256sums_x86_64=('b792b2cb35a31ae507171d9060d8e8d955d0153fd7ed9510d5be1d39d9380a45')
sha256sums_aarch64=('6cf954e3c8cf92c60891fe616fd7b11b9b0c7c2e61c54e05ee925bc674cee086')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-143.0.7499.192-18-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
