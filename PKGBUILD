# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=purple-plugin-pack
pkgver=2.8.0
pkgrel=1
pkgdesc="Plugins for libpurple and derived IM clients"
arch=('x86_64')
url="https://keep.imfreedom.org/pidgin/purple-plugin-pack"
license=('GPL')
depends=('libpurple')
makedepends=('meson' 'pidgin')
source=(https://downloads.sourceforge.net/pidgin/purple%20plugin%20pack/$pkgver/$pkgname-$pkgver.tar.xz{,.asc})
sha256sums=('82ccde9a7251a75b7e03a3f9a929014d8e008c1b6f46e58638f5f476da3e242d'
            'SKIP')
validpgpkeys=('40DE1DC7288FE3F50AB938C548F66AFFD9BDB729') # Gary Kramlich <grim@reaperworld.com>

prepare() {
  cd $pkgname-$pkgver
  mkdir build
}

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set ts=2 sw=2 et:
