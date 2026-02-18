# Maintainer: Misiix9 <admin@misiix.dev>
pkgname=vanta-bin
pkgver=1.1.0
pkgrel=2
pkgdesc="A hyper-fast, scriptable command palette for Wayland"
arch=('x86_64')
url="https://github.com/Misiix9/vanta"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('vanta')
conflicts=('vanta')
source=("vanta_${pkgver}_amd64.deb::https://github.com/Misiix9/vanta/releases/download/v${pkgver}/vanta_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    # Extract whichever data archive exists (gzip, xz, or zstd)
    find "${srcdir}" -maxdepth 1 -name "data.tar.*" -exec tar -xf {} -C "${pkgdir}" \;
}
