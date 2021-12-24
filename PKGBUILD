# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=flowtime
_pkgname=Flowtime
pkgver=1.2.0
pkgrel=1
pkgdesc="Get what motivates you done, without losing concentration"
arch=('x86_64')
url="https://github.com/Diego-Ivan/Flowtime"
license=('GPL3')
depends=('glib2' 'gtk4' 'gstreamer' 'libadwaita')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("${url}/archive/${pkgver}.tar.gz")
b2sums=('3e764eaff9cf04ccaed64a396ae91c65bf42976ae132e84af944116242397c9ad65cb0583daf382f007ecc7a05a170c2931234c568c720e7be9a0b7a73af0f35')

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
