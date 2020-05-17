pkgname=mingw-w64-gtk3-bin
pkgver=3.24.18
pkgrel=1
pkgdesc="SVG rendering library (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=('custom')
depends=(
  'mingw-w64-adwaita-icon-theme'
  'mingw-w64-atk'
  'mingw-w64-glib2'
  'mingw-w64-json-glib'
  'mingw-w64-libepoxy'
  'mingw-w64-shared-mime-info'
  'mingw-w64-gdk-pixbuf2'
  'mingw-w64-pango'
  'mingw-w64-cairo')
provides=('mingw-w64-gtk3')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-gtk3-$pkgver-1-any.pkg.tar.xz")
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
