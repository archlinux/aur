pkgname=mingw-w64-shared-mime-info-bin
pkgver=2.0
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info (mingw-w64)"
arch=('any')
url="https://www.gnome.org"
license=('custom')
depends=('mingw-w64-libxml2'
  'mingw-w64-glib2')
provides=('mingw-w64-shared-mime-info')
source=("http://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-shared-mime-info-2.0-1-any.pkg.tar.zst")
sha256sums=('420cf529fc7e0fd1662f2d45ec62687b6ac56506ca6ae2c18a890676411ba57a')

_architectures="x86_64-w64-mingw32"

package() {
  cd "${srcdir}/mingw64"
  for _arch in ${_architectures}; do
    mkdir -p ./* $pkgdir/usr/${_arch}/
    sed -i -e "s|/mingw64|/usr/${_arch}|" ./lib/pkgconfig/*
    cp -r ./* $pkgdir/usr/${_arch}/
  done
}
