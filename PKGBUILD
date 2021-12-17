# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime
_pkgname=Flowtime
pkgver=1.1.0
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('glib2' 'gtk4' 'gstreamer' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('04c5e7729e3fa6e04c8d252c18bae8d9a37c3c24ee062342ebed1bcfb85f669857acdc581ff67aa92e73d15c40744994093fb15c14d864eba56cb86de3df0c73')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
