# Maintainer: Yigit Sever <yigit@yigitsever.com>
pkgname=live-chart
pkgver=1.9.1
pkgrel=1
pkgdesc="A real-time charting library for Vala and GTK4 based on Cairo"
arch=('x86_64')
url="https://github.com/lcallarec/live-chart"
license=('MIT')
depends=('gtk3' 'gtk4' 'libgee')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7b5f1d0807b5f6e8b09e2c1dd468af22379578b55b38afd530c0ff006bc33e53')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
