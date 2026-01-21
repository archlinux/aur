# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=144.0.7559.96
pkgrel=20
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.96-20/omarchy-chromium-144.0.7559.96-20-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.96-20/omarchy-chromium-144.0.7559.96-20-aarch64.pkg.tar.zst")
sha256sums_x86_64=('bd72e654005065bd5e2b4b80e63dd6959b4aa5165f1efb44f6c237f3707756f2')
sha256sums_aarch64=('d5502bedbc969fa9e8370f7d1e0efefce821dd47d8e26a02be82e04b9631ebab')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-144.0.7559.96-20-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
