pkgname=mingw-w64-endian
pkgver=1
pkgrel=1
pkgdesc='endian.h (mingw-w64)'
arch=('any')
url="https://sourceware.org/elfutils/"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("git+https://github.com/mikepb/endian.h.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    install -d "$pkgdir"/usr/${_arch}/include
    install "${srcdir}"/endian.h/endian.h -m644 "$pkgdir"/usr/${_arch}/include
  done
}
