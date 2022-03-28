# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.2.1
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-qrcode')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('9371f96050c088eb58623ae341e71f6c89d64e536f93b1e9608ffcd28b8656266c76aaba345c9315d17384242e17482dca83d44f3e12272eec16bcccafd3a1c5')

build() {
  arch-meson "${pkgname%-git}-$pkgver" build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
