pkgname=typhoon
pkgver=1.3.1
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk' 'python' 'imagemagick' 'python-dbus' 'libportal' 'python-cairosvg')
makedepends=('git' 'meson' 'ninja')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  DESTDIR="$pkgdir" meson install -C build
}
