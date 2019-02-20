# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=quilter
pkgver=1.7.0
pkgrel=2
pkgdesc="Focus on your writing for any kind of story, even longer ones."
arch=(any)
url="https://github.com/lainsce/quilter"
depends=(granite gtksourceview3 gtk3 glib2 vala discount webkit2gtk gtkspell3)
makedepends=(unzip ninja meson)
install=quilter.install

source=(
  "https://github.com/lainsce/quilter/archive/${pkgver}.zip"
)
sha256sums=('646b78ffa90b1e944ffc7f1b49fffe6ebb8927270699896b105fdc4b91fcb0ce')

build () {
  cd $srcdir/$pkgname-$pkgver
  meson build && cd build
  meson configure -Dprefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}
