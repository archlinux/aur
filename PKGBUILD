# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=141.0.7390.76
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v141.0.7390.76-2/omarchy-chromium-141.0.7390.76-2-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v141.0.7390.76-2/omarchy-chromium-141.0.7390.76-2-aarch64.pkg.tar.zst")
sha256sums_x86_64=('6d537e7a5a8c0ab4914e4f3e4ca0b414ef5f608754bd2ae3b9272967a59e3cf0')
sha256sums_aarch64=('2543f6b9902e5e04e0c556983db254c04bb43c11c7a9b4c7a6fbeb3453be211e')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-141.0.7390.76-2-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
