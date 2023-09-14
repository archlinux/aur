pkgname=mingw-w64-lld
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="MinGW wrapper for -fuse-ld=lld (mingw-w64)"
depends=('lld' 'mingw-w64-binutils')
license=("GPL")
url="http://fedoraproject.org/wiki/MinGW"
source=("mingw-lld.sh")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    install -d "${pkgdir}"/usr/${_arch}/bin
    install -m 755 mingw-lld.sh "${pkgdir}"/usr/${_arch}/bin/lld
    pushd "${pkgdir}"/usr/${_arch}/bin
    ln -s lld ld.lld
    popd
  done
}
