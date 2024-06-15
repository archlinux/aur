# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=calligraphy
_pkgname=Calligraphy
pkgver=1.0.1
pkgrel=1
pkgdesc='Turn text into ASCII banners'
arch=('any')
url='https://gitlab.gnome.org/GeopJr/Calligraphy/'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('f7e8ea02dd82dae827f60f821f3e56cbbcff6a2c3402bea648049286ecf3b9e1')

build() {
  arch-meson $_pkgname-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
