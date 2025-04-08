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
sha256sums=('f9702b84c7a251f2a5094d01410aafc02bc0f5e30eee8852a7ea5e6f2288d03f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
