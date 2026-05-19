# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-0.1.6-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_amd64.deb")
sha256sums_x86_64=('b8781dfbe82f86aa4c86c44f3a592a1e100f981f0b925c958db20b2a98ecca11')

source_aarch64=("promptr-0.1.6-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_arm64.deb")
sha256sums_aarch64=('7033a97a0aa561291f52f1cb922c2df84f1fff2994255498d92b9720ab6f9d1c')

package() {
  bsdtar -xOf "${srcdir}/promptr-${pkgver}-${CARCH}.deb" data.tar.xz \
    | tar -x -C "${pkgdir}"
}
