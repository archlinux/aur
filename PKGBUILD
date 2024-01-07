# Maintainer: Yigit Sever <yigit@yigitsever.com>
pkgname=live-chart
pkgver=1.10.0
pkgrel=1
pkgdesc="A real-time charting library for Vala and GTK4 based on Cairo"
arch=('x86_64')
url="https://github.com/lcallarec/live-chart"
license=('MIT')
depends=('gtk3' 'gtk4' 'libgee')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('3f54c7569cc2a4711b5689038055aefc4321636f3e6dd4945e4be204bc9d4843')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
