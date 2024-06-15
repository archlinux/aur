# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
# Special thanks to: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=webfontkitgenerator
pkgnamehyphenated=webfont-kit-generator
pkgver=1.1.1
pkgrel=1
pkgdesc='Create @font-face kits easily'
arch=('any')
url='https://github.com/rafaelmardojai/webfontkitgenerator'
license=('GPL3')
depends=('gtk4' 'gtksourceview5' 'gst-python' 'libadwaita' 'python-fonttools' 'python-brotli')
makedepends=('appstream-glib' 'meson' 'git' 'pkgconf' 'blueprint-compiler')
source=("$url/archive/$pkgver/$pkgnamehyphenated-$pkgver.tar.gz")
sha256sums=('8d85f35e9c6a144d0584185fb528e7d03b24b35530cd66d09496ceb71d5c05bd')

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
