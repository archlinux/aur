# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-0.1.8-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_amd64.deb")
sha256sums_x86_64=('2dc08ebb9f6dd68b616874c50e6807630fc81e7029fafe19958e1a7c188adda0')

source_aarch64=("promptr-0.1.8-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_arm64.deb")
sha256sums_aarch64=('061003b000691a0df3adb77a8e99740b9c7e02650f3b70ccda620697cf3ef637')

package() {
  bsdtar -xOf "${srcdir}/promptr-${pkgver}-${CARCH}.deb" data.tar.xz \
    | tar -x -C "${pkgdir}"
}
