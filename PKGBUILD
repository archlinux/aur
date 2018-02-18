
pkgname=mingw-w64-ldd
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Tool to list dependencies of a DLL"
depends=('wine' 'python')
license=("WTFPL")
url="https://github.com/xantares/mingw-ldd"
source=('https://github.com/xantares/mingw-ldd/raw/master/dependency.py')
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  install -d "${pkgdir}"/usr/bin
  install -d "${pkgdir}"/usr/share/mingw
  install -m 755 dependency.py "${pkgdir}"/usr/share/mingw/
  for _arch in ${_architectures}; do
    cd "${pkgdir}"/usr/bin
    ln -s ../share/mingw/dependency.py ${_arch}-ldd
  done
}
