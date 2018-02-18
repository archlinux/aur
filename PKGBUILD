
pkgname=mingw-w64-ldd
pkgver=1
pkgrel=1
arch=('any')
pkgdesc="Tool to list dependencies of a DLL"
depends=('wine' 'python')
license=("WTFPL")
url="https://gist.github.com/xantares/04cd1c47cb242ddf49b848045260c014"
source=('https://gist.githubusercontent.com/xantares/04cd1c47cb242ddf49b848045260c014/raw/c78bee9a2f85590941dd4a1167a7ca191a313c1e/dependency.py')
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
