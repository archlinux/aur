# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-hibernate
_pkgname=gnome-shell-hibernate-extension
pkgver=8
pkgrel=1
pkgdesc="A GNOME extension that adds the option to hibernate amongst other system actions"
arch=('any')
url="https://codeberg.org/kiyui/gnome-shell-hibernate-extension"
license=('GPL2')
depends=('gnome-shell' 'gnome-shell-extensions')
makedepends=('meson')
source=($url/archive/$pkgver.tar.gz)
b2sums=('c03d77c07ae1e8a85c6f89ef6c5b8a96a59e93cf6db567bab4a7b3c689335b9f01344571650aba81d645db6b8175341fb7249564b0222414be403aa27838ead0')

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build
}


package() {
  meson install -C build --destdir "$pkgdir"
}
