# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.6
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('libadwaita' 'zint')
makedepends=('meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('2130d07ac72ad287752b02f1ad3c8ded8c6bb47e675d7ce51635753d6a62a27479926282045aa5e9fdfca1383a48ed61d9f0b16892688feb2ae9e92e04a041e3')

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
