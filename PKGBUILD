# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
# Special thanks to: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=webfontkitgenerator
pkgnamehyphenated=webfont-kit-generator
pkgver=0.4.0
pkgrel=1
pkgdesc='Create @font-face kits easily'
arch=('any')
url='https://github.com/rafaelmardojai/webfontkitgenerator'
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'gst-python' 'libhandy' 'python-fonttools' 'python-brotli')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/archive/$pkgver/$pkgnamehyphenated-$pkgver.tar.gz")
sha256sums=('014a1b760ea0bd2ee4a1c14f270010f8acb831d81b05272a3b71be400129eb35')

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