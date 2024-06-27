# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo-git
pkgver=0.8.1+13+g8b14d81
pkgrel=1
pkgdesc="Simple and fast keyboard focused IDE written in Crystal and GTK."
arch=("x86_64")
conflicts=("tijolo")
provides=("tijolo")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("graphene" "vulkan-icd-loader" "hicolor-icon-theme" "libadwaita" "libevent" "pcre2" "gc" "vte4" "gtksourceview5" "gdk-pixbuf2" "gcc-libs" "glibc" "glib2" "pango" "dconf" "gtk4" "harfbuzz" "cairo")
makedepends=("git" "shards" "crystal" "gobject-introspection-runtime")
source=("tijolo-git::git+https://github.com/hugopl/tijolo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed s/-/+/g | sed s/v//
}

build() {
  cd "$srcdir/tijolo-git"
  make
}

package() {
  cd "$srcdir/tijolo-git"
  make install DESTDIR="${pkgdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
