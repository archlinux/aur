# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>

pkgname=morphosis
pkgver=1.4.1
pkgrel=1
pkgdesc='Convert your documents'
arch=('any')
url='https://gitlab.gnome.org/World/morphosis'
license=('GPL3')
depends=('gtk4' 'pandoc')
makedepends=('appstream-glib' 'meson' 'git' 'blueprint-compiler')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('999a15a1cc907ea9f6b837d087a6ec03f17b844025a115f73a04a562e1058b50')

build() {
  arch-meson $pkgname-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
