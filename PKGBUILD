# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime
_pkgname=Flowtime
pkgver=2.0.1
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('glib2' 'gstreamer' 'libadwaita' 'libxml2')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('d5e0120c9e6cc4efcd1d830134ad19441cf10c0fda93d92b1b42a0f277fbe1cfe118916b88b803fff73216feb735b7debf66c2d23a5089e665e68b2be44b6e4c')

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
