# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=143.0.7499.146
pkgrel=16
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v143.0.7499.146-16/omarchy-chromium-143.0.7499.146-16-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v143.0.7499.146-16/omarchy-chromium-143.0.7499.146-16-aarch64.pkg.tar.zst")
sha256sums_x86_64=('f57e865ea2703f4d43a30c690cde43991f4be9c66d11639355bebcd2ead2d8ce')
sha256sums_aarch64=('a606b3355ec09d0658ad75e7f3cc9e5938f162da36c4695b583021d963c2aa92')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-143.0.7499.146-16-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
