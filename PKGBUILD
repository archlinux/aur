# Maintainer: Helmut Januschka <helmut@januschka.com>

pkgname=omarchy-chromium-bin
pkgver=144.0.7559.59
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
source_x86_64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.59-19/omarchy-chromium-144.0.7559.59-19-x86_64.pkg.tar.zst")
source_aarch64=("https://github.com/omacom-io/omarchy-chromium/releases/download/v144.0.7559.59-19/omarchy-chromium-144.0.7559.59-19-aarch64.pkg.tar.zst")
sha256sums_x86_64=('0d81690156f6d92914d4d774007c0e1c7aedf3ba0c4421fd308c2b0422666cd4')
sha256sums_aarch64=('afdfe28fbdf358a77ebfdfbbd77e672a307b0c582c35efd0aaccd1859cf4453e')

package() {
    cd "$srcdir"
    
    # Extract the package (filename varies by architecture)
    tar -xf omarchy-chromium-144.0.7559.59-19-${CARCH}.pkg.tar.zst
    
    # Copy everything to the target directory
    cp -r usr "$pkgdir/"
}
