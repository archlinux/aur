# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=typhoon
pkgver=0.9.7
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick' 'python-dbus')
makedepends=('git' 'meson' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ba327a058cc6342d1198fc4c282f65a88bf0b84a2afdb2377344835e4ef6f4da')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
