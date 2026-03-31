# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=146.0.7680.177
pkgrel=14
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.177-14/omarchy-chromium-146.0.7680.177-14-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.177-14/omarchy-chromium-146.0.7680.177-14-aarch64.pkg.tar.zst")
sha256sums_x86_64=('23f0b589321bfabc6bd5d796b2fc9aab817f212d7456b93a1ef0eb242ac48501')
sha256sums_aarch64=('b7fc501206983393b8ef44227d0a47fc3966a7819c6678b48a7c8468e0047b17')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-146.0.7680.177-14-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
