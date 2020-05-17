pkgname=mingw-w64-json-glib-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="JSON-GLib implements a full suite of JSON-related tools using GLib and GObject (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=('custom')
depends=('mingw-w64-glib2')
provides=('mingw-w64-json-glib')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-json-glib-1.4.4-1-any.pkg.tar.xz")
sha256sums=('d3610c06e2a4fd0c24bf7927d3ec22b1efda6cf005c4cb3eae6dd8639a5e8d7b')

_architectures="x86_64-w64-mingw32"

package() {
  cd "${srcdir}/mingw64"
  for _arch in ${_architectures}; do
    mkdir -p ./* $pkgdir/usr/${_arch}/
    sed -i -e "s|/mingw64|/usr/${_arch}|" ./lib/pkgconfig/*
    cp -r ./* $pkgdir/usr/${_arch}/
  done
}
