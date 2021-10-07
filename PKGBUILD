# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Gustavo Peredo <gustavomperedo@protonmail.com>

pkgname=fontdownloader
_pkgname=font-downloader
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple GTK font downloader"
arch=('x86_64')
url="https://github.com/GustavoPeredo/font-downloader"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#branch=release")
_commit=0ac8007397d65793ef15ed5b910e4b300b6bdb3a
sha256sums=('SKIP')

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}