# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=140.0.7339.185
pkgrel=2
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v140.0.7339.185-2/omarchy-chromium-140.0.7339.185-2-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v140.0.7339.185-2/omarchy-chromium-140.0.7339.185-2-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a2cc0a651a3ccf1b24c9ca680cf0734b5b8ab56d4f2ba29c38a8fd32e0557a5b')
sha256sums_aarch64=('57bd5a2d1a0039d49d5e6fa811930160b21ab29637c2b5676e1ea82b14aa36ad')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-140.0.7339.185-2-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
