# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=warble
pkgver=2.0.1
pkgrel=1
pkgdesc="Native Linux word-guessing game built in Vala and Gtk"
url="https://github.com/avojak/${pkgname}"
arch=($CARCH)
license=('GPL')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a68fb46315114f6ed613560d6d43b4a8f7cc31a298a32e43084bc9277e10afe7')
depends=('glib2>=2.72.1' 'gtk4>=4.6.3' 'granite7>=7.0.0' 'libadwaita>=1.1.0', 'libgee>=0.20.5')
makedepends=(meson 'vala>=0.28.0')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
