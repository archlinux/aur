# Maintainer: Manoel Vilela <manoel_vilela@engineer.com>
pkgname=wunderlistux-gtk
_pkgname=wunderlistux
pkgver=0.0.9
pkgrel=1
pkgdesc="A wunderlist app using vala and webkit as alternative to electron."
arch=('any')
url="https://github.com/edipox/wunderlistux"
license=('GPL')
depends=('webkit2gtk')
makedepends=('cmake' 'make' 'vala')
source=("git://github.com/edipox/wunderlistux.git#branch=vala_webkit")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

package() {
	cd "$srcdir/$_pkgname/build"
	mkdir $pkgdir/usr
	make install

        rm $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled
        rm $pkgdir/usr/share/icons/hicolor/icon-theme.cache
}
