# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('nwg-launchers')
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK+ launchers for sway, i3 and some other WMs"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-launchers"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gtk3' 'gtkmm3' 'nlohmann-json')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('2302b156d4fc9d505ae14f25da7ddfb9')

build() {
   cd "$srcdir/$pkgname-${pkgver}"
   meson builddir -Dbuildtype=release -Dprefix=/usr
   ninja -C builddir
}

package() {
   cd "$srcdir/$pkgname-${pkgver}"
   DESTDIR="$pkgdir" ninja -C builddir install
}

