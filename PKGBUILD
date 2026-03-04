# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=145.0.7632.159
pkgrel=8
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v145.0.7632.159-8/omarchy-chromium-145.0.7632.159-8-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v145.0.7632.159-8/omarchy-chromium-145.0.7632.159-8-aarch64.pkg.tar.zst")
sha256sums_x86_64=('4ee19c50afa0a0a8726b62a4d10d2392ae4576526ed9eeb0b8c02164b63072d3')
sha256sums_aarch64=('d13e8591b3fa3f4b423a42afb86238e1bbad6587b237aea1d9d836d8be1a9f98')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-145.0.7632.159-8-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
