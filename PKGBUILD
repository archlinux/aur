# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-0.1.4-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_amd64.deb")
sha256sums_x86_64=('75b3d44fcfe128e570bb76e0ccca418b06cf98fab61e2d76c3c04475be90518a')

source_aarch64=("promptr-0.1.4-${CARCH}.deb::https://github.com/toxdes/promptr/releases/download/v${pkgver}/promptr_${pkgver}_arm64.deb")
sha256sums_aarch64=('be9fd434f4e55a692c1377c10def2596488eb5a4da0de8e3e06e26ba2e25f7ec')

package() {
  bsdtar -xOf "${srcdir}/promptr-${pkgver}-${CARCH}.deb" data.tar.xz \
    | tar -x -C "${pkgdir}"
}
