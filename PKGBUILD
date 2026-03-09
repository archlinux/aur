# Maintainer: Bink
pkgname=memerist
pkgver=0.4.4
pkgrel=1
pkgdesc="A modern meme editor built with GTK 4 and Libadwaita"
arch=('x86_64' 'aarch64')
url="https://github.com/vani-tty1/memerist"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'glib2'
  'libpng'
  'libjpeg'
)
makedepends=(
  'meson'
  'ninja'
  'gcc'
  'pkg-config'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vani-tty1/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d14df8520b0967fe2721773b7253e70becd66a8faca0f51e9d4fe3532fb15716')
b2sums=('f12510c3c884673d5e08b456836a3b11f4284d5eafc92d3384fc758f74733f7f0e3a8a6a8ab584fff83b3169a638bb0d517d7d543bb6076643971e62d4de41dc')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  meson install -C build --destdir="${pkgdir}"
}
