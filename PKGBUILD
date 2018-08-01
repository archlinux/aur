# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=quilter
pkgver=1.6.1
pkgrel=1
pkgdesc="Focus on your writing for any kind of story, even longer ones."
arch=(any)
url="https://github.com/lainsce/quilter"
depends=(granite gtksourceview3 gtk3 glib2 vala discount webkit2gtk gtkspell3)
makedepends=(unzip ninja meson)
install=quilter.install

source=(
  "https://github.com/lainsce/quilter/archive/${pkgver}.zip"
)
sha256sums=('400b11c32a345017148b70c4538ef6e0ab248633c52220066593916804938ede')

build () {
  cd $srcdir/$pkgname-$pkgver
  meson build && cd build
  meson configure -Dprefix=${pkgdir}/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}
