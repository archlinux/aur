# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.4.0
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'gtkmm3' 'nlohmann-json')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('e61d4b48501428b44573bfc7fd64756a')

build() {
   cd "$srcdir/$pkgname-${pkgver}"
   meson builddir -Dbuildtype=release -Dprefix=/usr
   ninja -C builddir
}

package() {
   cd "$srcdir/$pkgname-${pkgver}"
   DESTDIR="$pkgdir" ninja -C builddir install
}

