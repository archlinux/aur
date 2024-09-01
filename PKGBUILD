# Maintainer: dec05eba <dec05eba@protonmail.com>

pkgname=gpu-screen-recorder-notification
pkgver=r28.ee4ac97
pkgrel=1
pkgdesc='Notification in the style of ShadowPlay'
arch=('x86_64')
url="https://git.dec05eba.com/gpu-screen-recorder-notification"
license=('GPL-3.0-only')
makedepends=('meson')
depends=('libglvnd' 'libx11' 'libxrandr' 'libxrender')
provides=('gsr-notify')
conflicts=('gsr-notify')
source=("${pkgname}-${pkgver}.tar.gz::https://dec05eba.com/snapshot/gpu-screen-recorder-notification.git.${pkgver}.tar.gz")
sha512sums=('c3979c606639dab1ea8602da14c4619a194c65ee997c92eaf45836bde03dcb90f11e3f4dc6ed36228ad615be541f9331ee7a733b85e55124605500f974464de8')

build() {
  cd "$srcdir"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir"
  meson install -C build --destdir "$pkgdir"
}
