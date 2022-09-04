# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=spedread
_pkgname=Spedread
pkgver=2.2.1
pkgrel=1
pkgdesc="GTK speed reading software: Read like a speedrunner!"
arch=('x86_64')
url="https://github.com/Darazaki/Spedread"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('2ebc8d20ddd8208ca8872bddf83bd977893573d1a0f180d8022daa0e44780c165c1f5050b128dfdf8e834994fff60ffa8cb3cefe3b2de109ef124e7c20c3ee07')

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
