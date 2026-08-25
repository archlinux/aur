# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=calligraphy
_pkgname=Calligraphy
pkgver=1.3.0
pkgrel=1
pkgdesc='Turn text into ASCII banners'
arch=('any')
url='https://codeberg.org/GeopJr/Calligraphy'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('3ea28f487820f164b96e3a48216d6822971fa4b508a42ae74f54959e358e78fc')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
