# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=typhoon
pkgver=0.9.80
pkgrel=3
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick' 'python-dbus')
makedepends=('git' 'meson' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6da4e0bc2c5f7ae647981b5db2d34d82b2b407e175f1e0eed2f6c7fd5d8200ce')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
