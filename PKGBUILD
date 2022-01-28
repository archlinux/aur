# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=emblem
pkgver=1.0.0
pkgrel=1
pkgdesc="Generate project avatars for your Matrix rooms an git forges"
arch=('x86_64')
url="https://gitlab.gnome.org/World/design/emblem"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=($url/-/archive/$pkgver/$pkgname-$pkgver.tar)
b2sums=('2d8a56205f45dcc336449d923d94ef2c4b5fa4f3e693c830ec37e6fbd6dfd4fbd7dfd3be5d91d03db08eacdaebe8c998a2d9b8e8ec57935d992e642ab4f41f98')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
