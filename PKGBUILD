# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=quilter
pkgver=1.3.5
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
sha256sums=('dc7d95566250ed0d533744162717884eff7c185086f213308220c3463a41bb1b')

build () {
  cd $srcdir/$pkgname-$pkgver
  meson build && cd build
  mesonconf -Dprefix=${pkgdir}/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}
