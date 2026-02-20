# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="A hyper-fast, scriptable application launcher and command palette for Wayland"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/vanta/releases/download/v${pkgver}/vanta_${pkgver}_amd64.deb")
sha256sums=('5077e158228faac43fd74ca6bf2332daeba2ba70c6fd110f1a2bd4d37e4fef2c')

package() {
    # Extract whichever data archive exists (gzip, xz, or zstd)
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
