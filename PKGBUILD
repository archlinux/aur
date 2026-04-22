# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=147.0.7727.116
pkgrel=19
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v147.0.7727.116-19/omarchy-chromium-147.0.7727.116-19-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v147.0.7727.116-19/omarchy-chromium-147.0.7727.116-19-aarch64.pkg.tar.zst")
sha256sums_x86_64=('30eba48f25e3cbdcc6b69990ad5220d5afd50b29415fd1c21010548230802871')
sha256sums_aarch64=('15e58f86bed15ba995a463221d95eecefd4cdd0808ab49d48b5474c6b58031b1')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-147.0.7727.116-19-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
