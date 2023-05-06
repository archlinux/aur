# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
# Special thanks to: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=webfontkitgenerator
pkgnamehyphenated=webfont-kit-generator
pkgver=1.0.3
pkgrel=1
pkgdesc='Create @font-face kits easily'
arch=('any')
url='https://github.com/rafaelmardojai/webfontkitgenerator'
license=('GPL3')
depends=('gtk4' 'gtksourceview5' 'gst-python' 'libadwaita' 'python-fonttools' 'python-brotli')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/archive/$pkgver/$pkgnamehyphenated-$pkgver.tar.gz")
sha256sums=('d985e2ce6640833847570b6aeb7956e00b91ce4044a4c9b3f182601452f8cde9')

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
