# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=146.0.7680.164
pkgrel=13
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.164-13/omarchy-chromium-146.0.7680.164-13-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v146.0.7680.164-13/omarchy-chromium-146.0.7680.164-13-aarch64.pkg.tar.zst")
sha256sums_x86_64=('061d6274003c229652bb6c128309746c42bf46c081c5a2e3bc13789ee8dfb587')
sha256sums_aarch64=('7b9e0ca67e8aa12038afc63e127fb7bb7b5f0ef7b8fed383303863785637681f')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-146.0.7680.164-13-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
