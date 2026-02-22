pkgname=typhoon
pkgver=1.7.0
pkgrel=1
pkgdesc="A stylish weather app based on Stormcloud"
arch=('any')
url="https://github.com/archisman-panigrahi/typhoon"
license=('GPL-3.0-or-later')
depends=('python' 'python-pyqt6' 'python-pyqt6-webengine' 'python-dbus' 'python-gobject' 'libportal' 'python-cairosvg')
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
