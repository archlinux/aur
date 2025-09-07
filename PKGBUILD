# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=140.0.7339.41
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v140.0.7339.41-2/omarchy-chromium-140.0.7339.41-2-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v140.0.7339.41-2/omarchy-chromium-140.0.7339.41-2-aarch64.pkg.tar.zst")
sha256sums_x86_64=('6bc81e6da49f077cf3b928246ce911055a56137b4a4ac4171a45daa41ed4abc0')
sha256sums_aarch64=('b7cae8ed2980f96b9a829938e3abe8c2917e4371a4e24332ad9c87e4fa0ef3af')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-140.0.7339.41-2-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
