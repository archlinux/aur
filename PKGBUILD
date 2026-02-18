# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=145.0.7632.109
pkgrel=6
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v145.0.7632.109-6/omarchy-chromium-145.0.7632.109-6-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v145.0.7632.109-6/omarchy-chromium-145.0.7632.109-6-aarch64.pkg.tar.zst")
sha256sums_x86_64=('3a11f720e882cc1926eb0f5aaf2bbce0091c7bd2429d69d4961527f7af63ad62')
sha256sums_aarch64=('32427b3b1cbd06c0a7a14b2d7406c169871f93eb5f8500676656bf0dbd34c0d2')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-145.0.7632.109-6-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
