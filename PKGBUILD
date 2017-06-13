# Contributor: Jishnu Mohan jishnu7 at gmail dot com

pkgname=quilter
pkgver=1.0.7
pkgrel=1
pkgdesc="Focus on your writing for any kind of story, even longer ones."
arch=(any)
url="https://github.com/lainsce/quilter"
depends=(granite gtksourceview3 gtk3)
makedepends=('unzip ninja meson')
source=(
  "https://github.com/lainsce/quilter/archive/${pkgver}.zip"
)
sha256sums=('25a306fb3a7239c9f95138f6d029f23324fb20e6fc73d8a58763fbbeaf2ef539')

build () {
  cd $srcdir/$pkgname-$pkgver
  meson build && cd build
  mesonconf -Dprefix=${pkgdir}/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  DESTDIR="$pkgdir" ninja install
}
