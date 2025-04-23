# Maintainer: Archisman Panigrahi <apandada1@gmail.com>
pkgname=typhoon
pkgver=0.9.85
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL3')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick' 'python-dbus')
makedepends=('git' 'meson' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e7d97456289f202db9511c7ea68421e8558e57614fa45bcda7663ae9199a9d14')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
