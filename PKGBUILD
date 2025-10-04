# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=141.0.7390.54
pkgrel=1002
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v141.0.7390.54-1002/omarchy-chromium-141.0.7390.54-1002-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v141.0.7390.54-1002/omarchy-chromium-141.0.7390.54-1002-aarch64.pkg.tar.zst")
sha256sums_x86_64=('11a2e2c0a023bc14a603f0e7d5978845a1b8595775877274f34554e2b461924d')
sha256sums_aarch64=('1fa3b7bd58370b463e5651bf31c3fa1ead4b98ccd977c18f0da4ea715de57066')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-141.0.7390.54-1002-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
