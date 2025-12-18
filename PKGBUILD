# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=143.0.7499.169
pkgrel=17
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v143.0.7499.169-17/omarchy-chromium-143.0.7499.169-17-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v143.0.7499.169-17/omarchy-chromium-143.0.7499.169-17-aarch64.pkg.tar.zst")
sha256sums_x86_64=('ef842f082b4683eaadb638d14c48d7c91837e8829b7b53c2f4e1445c403a3307')
sha256sums_aarch64=('5dc9033b8a83afaddebd64bad12d9bee1003c7a75de26cc10e6ce9c5bc89e554')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-143.0.7499.169-17-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
