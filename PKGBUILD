# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime
_pkgname=Flowtime
pkgver=1.5.0
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('glib2' 'gtk4' 'gstreamer' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('f8e10180022f81bc9fa67e3a0c4cd8aea50942242fac98e2bc79519fbded39b9a98166f9841125407e862e145266ac6fc6e1580b0e8fbad1b9a43203ab6bd92e')

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
