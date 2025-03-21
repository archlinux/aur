# Maintainer: 
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.11.3
pkgrel=1
pkgdesc='CLI for MEGA'
arch=(x86_64)
url='https://xff.cz/megatools'
license=(GPL2)
depends=(curl glib2)
makedepends=(asciidoc docbook2x git meson)
source=(git+https://xff.cz/git/megatools?signed#tag=${pkgver})
sha256sums=('de1722ece8a2a4f96f8ce78698b962a8ec3645de98ea4a1ab442c7e5c8258cdd')
validpgpkeys=(EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED) # Ondrej Jirman <megous@megous.com>

build() {
  arch-meson $pkgname build -D symlinks=true -D man=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
