# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
# Special thanks to: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=webfontkitgenerator
pkgnamehyphenated=webfont-kit-generator
pkgver=1.0.0
pkgrel=1
pkgdesc='Create @font-face kits easily'
arch=('any')
url='https://github.com/rafaelmardojai/webfontkitgenerator'
license=('GPL3')
depends=('gtk4' 'gtksourceview5' 'gst-python' 'libadwaita' 'python-fonttools' 'python-brotli')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/archive/$pkgver/$pkgnamehyphenated-$pkgver.tar.gz")
sha256sums=('8f7d2f60b6c1d6bd2f088bba970c6e4f3548710597f12a60505d5d485a95335c')

build() {
  arch-meson $pkgnamehyphenated-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
