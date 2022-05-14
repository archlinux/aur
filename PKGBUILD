# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=warp-share-files
_pkgname=warp
pkgver=0.1.1
pkgrel=1
pkgdesc="Share files with each other effortlessly"
arch=('x86_64')
url="https://gitlab.gnome.org/felinira/warp"
license=('GPL3')
depends=('glib2' 'libadwaita')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar)
b2sums=('910c1c899430a5a6eaf0b707472591c8d200c5438104b5fee49f32fb1b313fc9e640a1a7d698e1e3d6fa1e3cb4789a8ab39e4fde7fb3731f760fc494c288af3e')

build() {
  arch-meson "$_pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
