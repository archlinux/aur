# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=rnote
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple note taking application written in Rust and GTK4"
arch=('x86_64')
url="https://github.com/flxzt/rnote"
license=('GPL3')
depends=('gtk4' 'glib2' 'libadwaita')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
sha512sums=('a196a5a9af6e5567949bcd680e0a6bc54128a9b80c89d5a574c0a12b911d076848983f3ddc769dce34ee82f7f176bea54988d639fd71eb2d6a4609bc0d17d32d')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
