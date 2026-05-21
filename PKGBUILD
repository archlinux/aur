# Maintainer: toxdes <hi@toxdes.com>
pkgname=promptr-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="GTK4 overlay prompt for opencode"
arch=('x86_64' 'aarch64')
url="https://github.com/toxdes/promptr"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'gtk4-layer-shell')

source_x86_64=("promptr-0.1.8-${CARCH}.deb::https://packages.toxdes.com/apt/pool/main/p/promptr/promptr_${pkgver}_amd64.deb")
sha256sums_x86_64=('86cd616a15be8f751673fb872349b9e2322c795deb38629bf1d249fd397a2ef0')

source_aarch64=("promptr-0.1.8-${CARCH}.deb::https://packages.toxdes.com/apt/pool/main/p/promptr/promptr_${pkgver}_arm64.deb")
sha256sums_aarch64=('c7ef9eca2d26a95274ae6073456cc4803a09c2c215de873565ad12fa44337700')

package() {
  bsdtar -xOf "${srcdir}/promptr-${pkgver}-${CARCH}.deb" data.tar.xz \
    | tar -x -C "${pkgdir}"
}
