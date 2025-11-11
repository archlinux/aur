# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=142.0.7444.162
pkgrel=11
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v142.0.7444.162-11/omarchy-chromium-142.0.7444.162-11-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v142.0.7444.162-11/omarchy-chromium-142.0.7444.162-11-aarch64.pkg.tar.zst")
sha256sums_x86_64=('15766308d39bd6f3d5f6a09c27e14afa9f01cca803eaa167fc6ec4f5849d8163')
sha256sums_aarch64=('5f3e924ec05ab51afbc8c4504df4aa2b0301b7bf237d099b9f9bee2ae40ca160')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-142.0.7444.162-11-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
