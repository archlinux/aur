# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=146.0.7680.153
pkgrel=12
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.153-12/omarchy-chromium-146.0.7680.153-12-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.153-12/omarchy-chromium-146.0.7680.153-12-aarch64.pkg.tar.zst")
sha256sums_x86_64=('0ad424f38b2a0802db752db8e1a897b24f83806c95d3b336567cbe73b7c2dfb5')
sha256sums_aarch64=('08b8d592e19e2e7a4f6a54a7e8b898141f203ead9cacf7c1f3016ab1a98656f2')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-146.0.7680.153-12-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
