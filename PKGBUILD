# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=145.0.7632.75
pkgrel=3
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v145.0.7632.75-3/omarchy-chromium-145.0.7632.75-3-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v145.0.7632.75-3/omarchy-chromium-145.0.7632.75-3-aarch64.pkg.tar.zst")
sha256sums_x86_64=('b7482ccf9c6f1e3c5f2b14bbd874f2177e6de2bd905bdf01f9e8467d5b79c321')
sha256sums_aarch64=('c4dace3a4fb4a49c1c23f9b4985ba6386ea493062b7994605458ea033efb6502')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-145.0.7632.75-3-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
