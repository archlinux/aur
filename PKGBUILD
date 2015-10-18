pkgname=mingw-w64-asio
pkgver=1
pkgrel=1
pkgdesc="Cross-platform C++ library for ASynchronous network I/O (mingw-w64 symlinks)"
arch=(any)
url="http://asio.sourceforge.net/"
license=("custom")
depends=(mingw-w64-crt asio)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
		mkdir -p "$pkgdir/usr/${_arch}/include/"
    ln -s /usr/include/asio "$pkgdir/usr/${_arch}/include/asio"
  done
}
