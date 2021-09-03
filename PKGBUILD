# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-hibernate
_pkgname=gnome-shell-hibernate-extension
pkgver=7
pkgrel=1
pkgdesc="A GNOME extension that adds the option to hibernate amongst other system actions"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-hibernate-extension"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('meson')
source=($url/archive/$pkgver.tar.gz)
sha256sums=('4232980e25cf156c4425c48f696dbaae6f6998a2877a9c6bbf6215ad4db58c66')

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
