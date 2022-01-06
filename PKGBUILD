# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=imeditor
pkgver=0.9.7
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=('any')
url="https://imeditor.github.io"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ImEditor/ImEditor/archive/$pkgver.tar.gz")
sha256sums=('d067c356493bd36d88d4074498399bb42a1a49d819f0699c886c8a8e2e125921')

build() {
  arch-meson ImEditor-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
