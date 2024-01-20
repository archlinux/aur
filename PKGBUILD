# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=imeditor
pkgver=0.9.8
pkgrel=1
pkgdesc="Simple & versatile image editor."
arch=('any')
url="https://imeditor.github.io"
license=('GPL-3.0-or-later')
depends=('gtk3' 'python-gobject' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ImEditor/ImEditor/archive/$pkgver.tar.gz")
sha256sums=('4a800966e31ff9bd9f0acae81ab1efd13a25880a99a6a5019bd2ec59895218b9')

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
