# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-0.1.5-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_amd64.deb")
sha256sums_x86_64=('bc50ec375b7ab8119fa627f89e85663fe91d92298004e8e39f4f046f9aa343b5')

source_aarch64=("promptr-0.1.5-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_arm64.deb")
sha256sums_aarch64=('aaebbd2c821b05862340917db0d9a4008298da5a57d3f3dea21c77bc5cdd79e4')

package() {
  bsdtar -xOf "${srcdir}/promptr-${pkgver}-${CARCH}.deb" data.tar.xz \
    | tar -x -C "${pkgdir}"
}
