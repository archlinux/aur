# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=144.0.7559.132
pkgrel=24
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.132-24/omarchy-chromium-144.0.7559.132-24-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.132-24/omarchy-chromium-144.0.7559.132-24-aarch64.pkg.tar.zst")
sha256sums_x86_64=('a21d5bd41adf2a1fadb578eb06b053ce3fca3ab95b58b3ef04432910a0a5633a')
sha256sums_aarch64=('2d9ce02fad8cf91da63c7595e31c6cdbc58b18c7f614df574408141a9e5c4d42')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-144.0.7559.132-24-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
