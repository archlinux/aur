# Maintainer: jgmdev <jgmdev@gmail.com>
# Contributor: Dan Johansen <strit@strits.dk>

_pkgname=windecor
pkgname=wayfire-plugins-windecor
pkgver=0.9.0
pkgrel=1
pkgdesc="A more sophisticated alternative to the wayfire built-in window decoration plugin."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=('wayfire' 'librsvg')
makedepends=('meson')
source=("https://gitlab.com/wayfireplugins/windecor/-/archive/v${pkgver}/windecor-v${pkgver}.tar.gz")
md5sums=('83e66a39992c2a3d413e27314bbc8b19')

build() {
  cd "${_pkgname}-v${pkgver}"
  arch-meson --buildtype=release build
  meson compile -C build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" meson install -C build
}
