# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.5
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('libadwaita' 'zint')
makedepends=('meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('1f7786d939fec7b2d04471fc04c439e41eac5605e1f298b0b0436f94062aa32dd14a276d01a7f6961bf881d521a569cc0f83598a3cd58ca40de5b284b4e38cfa')

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
