# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=letterpress
pkgver=1.3.0
pkgrel=1
pkgdesc="Uses jp2a to turn your pictures into images made up of ASCII Characters."
arch=('any')
url="https://gitlab.com/gregorni/Letterpress"
license=('GPL3')
depends=('jp2a' 'libadwaita' 'python-gobject')
makedepends=('blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
source=("https://gitlab.com/gregorni/Letterpress/-/archive/$pkgver/Letterpress-$pkgver.tar.gz")
sha256sums=('f6f64c2c4df15bcbb5a41feac478593dc69f8fae8ea20a279166d967dfec6b6a')

build() {
  arch-meson "Letterpress-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
