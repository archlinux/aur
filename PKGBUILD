pkgname=mingw-w64-pkg-config
pkgver=2
pkgrel=3
pkgdesc='Support pkg-config script (does not depend on any particular version of pkg-config). Useful for pkg-config powered cross-compiling with mingw-w64, see http://tinyurl.com/pkg-config-cross for more info'
arch=('any')
url=('http://pkg-config.freedesktop.org/')
license=('zlib')
depends=('pkg-config' 'mingw-w64-crt')
source=('x86_64-w64-mingw32-pkg-config' 'i686-w64-mingw32-pkg-config')
install='mingw-w64-pkg-config.install'
md5sums=('7a828d6aa57390613679edb208610045'
         '18530650bb2ef89bf91176cedd4ce20b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  # This indeed has to go to the "normal" directory tree
  install -d -m755 ${pkgdir}/usr/bin
  for _arch in ${_architectures}; do
    install -m755 ${_arch}-pkg-config  ${pkgdir}/usr/bin
  done
}
