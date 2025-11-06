# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=142.0.7444.134
pkgrel=10
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v142.0.7444.134-10/omarchy-chromium-142.0.7444.134-10-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v142.0.7444.134-10/omarchy-chromium-142.0.7444.134-10-aarch64.pkg.tar.zst")
sha256sums_x86_64=('bdc5a0141f473f154e322152863d02d51cccf374ae7ab93700876dd9278faa06')
sha256sums_aarch64=('c260f54356317db7859b9c6832ca4a03a4883b64206e1603bfa690bab3b451e9')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-142.0.7444.134-10-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
