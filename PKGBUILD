# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=146.0.7680.71
pkgrel=9
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.71-9/omarchy-chromium-146.0.7680.71-9-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.71-9/omarchy-chromium-146.0.7680.71-9-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a4d2e4719fabdaa0cd82cbdd15198fe76057432e05d7f81a1ad4a37a30b6cbd8')
sha256sums_aarch64=('101532ac6fba36eba5f0183193ddf2579593df99a7a224e00259b44c08e4c7b1')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-146.0.7680.71-9-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
