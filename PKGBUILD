# Maintainer: Archisman Panigrahi <apandada1 at gmail dot com>
# Special thanks to: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=webfontkitgenerator
pkgnamehyphenated=webfont-kit-generator
pkgver=0.5.0
pkgrel=1
pkgdesc='Create @font-face kits easily'
arch=('any')
url='https://github.com/rafaelmardojai/webfont-kit-generator'
license=('GPL3')
depends=('gtk3' 'gtksourceview4' 'gst-python' 'libhandy' 'python-fonttools' 'python-brotli')
makedepends=('appstream-glib' 'meson' 'git')
source=("$url/archive/$pkgver/$pkgnamehyphenated-$pkgver.tar.gz")
sha256sums=('3d7771a94ea9f0203f63d17cebdba6d03767fd9fb84b4cf9744919804d6064c9')

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