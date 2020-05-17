pkgname=mingw-w64-gdk-pixbuf2-bin
pkgver=4.6.0
pkgrel=1
pkgdesc="A text widget adding syntax highlighting and more to GNOME (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=('custom')
depends=('mingw-w64-crt')
provides=('mingw-w64-gdk-pixbuf2')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-gdk-pixbuf2-2.40.0-1-any.pkg.tar.xz")
sha256sums=('SKIP')

_architectures="x86_64-w64-mingw32"

package() {
  cd "${srcdir}/mingw64"
  for _arch in ${_architectures}; do
    mkdir -p ./* $pkgdir/usr/${_arch}/
    sed -i -e "s|/mingw64|/usr/${_arch}|" ./lib/pkgconfig/*
    cp -r ./* $pkgdir/usr/${_arch}/
  done
}
