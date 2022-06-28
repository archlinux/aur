# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=darkbar
pkgver=1.0.1
pkgrel=1
pkgdesc="Darken application titlebars based on your preference"
arch=('x86_64' 'aarch64')
url="https://github.com/bluesabre/darkbar"
license=('GPL3')
depends=('libhandy' 'libwnck3' 'libgee')
makedepends=('meson' 'vala')
source=(${url}/archive/$pkgver.tar.gz)
b2sums=('6f796161aa458eb8a0c5694d377fcba6322ed3857b9f743d32359b6e0d4c649bf8ead284edd2354d54c540924c7a51e00e34613cb7846360257ee5b7662435c2')
 
build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}
 
check() {
  meson test -C build || :
}
 
package() {
  meson install -C build --destdir "$pkgdir"
}
