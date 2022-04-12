# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=passes
pkgver=0.3
pkgrel=1
pkgdesc="A digital pass manager"
arch=('any')
url="https://github.com/pablo-s/passes"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-qrcode')
makedepends=('meson')
checkdepends=('appstream-glib')
source=($url/archive/v$pkgver.tar.gz)
b2sums=('14fddfc886f45ee89449d4a6244fe10c02e5196279b3ef01ca3a0e0736d25b6ad9fa15b6486716a0fc6d633fb766f28733e30d33b301af40a1a42fa715f9a01f')

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
