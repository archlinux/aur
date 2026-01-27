# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=144.0.7559.109
pkgrel=21
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.109-21/omarchy-chromium-144.0.7559.109-21-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.109-21/omarchy-chromium-144.0.7559.109-21-aarch64.pkg.tar.zst")
sha256sums_x86_64=('bcd5ec839823fa74f5bdf99cb9c6bfee9e2448db8da7cb4db794be5155d94cf7')
sha256sums_aarch64=('507d1d07a5c8f9c2101b82e6a6de975a2fcc2a2318668eb894b96719b144eae3')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-144.0.7559.109-21-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
