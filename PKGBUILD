# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=calligraphy
_pkgname=Calligraphy
pkgver=1.2.0
pkgrel=1
pkgdesc='Turn text into ASCII banners'
arch=('any')
url='https://gitlab.gnome.org/GeopJr/Calligraphy/'
license=('GPL3')
depends=('gtk4' 'libadwaita' 'python-pyfiglet')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('9cf40500bb5ccee09f8321de3f31f1117c32313b98368fca7be60791b44c6983')

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
