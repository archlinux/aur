# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-hibernate
_pkgname=gnome-shell-hibernate-extension
pkgver=9
pkgrel=1
pkgdesc="A GNOME extension that adds the option to hibernate amongst other system actions"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-hibernate-extension"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('meson')
source=($url/archive/$pkgver.tar.gz)
b2sums=('37c142f2893724ad5af628c9cede06a597f973d4332b5b432cde5300285634c5fc435acda96267ec29f734ffe808334849ea5d18a366ea548f8edc0e05428540')

build() {
  arch-meson "$_pkgname" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
