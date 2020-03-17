# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=vlang-bin
pkgver=0.1.24
pkgrel=1
pkgdesc='Simple, fast, safe, compiled language for developing maintainable software. Compiles itself in <1s with zero dependencies'
arch=('x86_64')
url="https://vlang.io"
license=('MIT')
provides=('vlang')
source=("https://github.com/vlang/v/releases/download/${pkgver}/v_linux.zip")
md5sums=('85b8f2ce310968e8660298e573d98cf7')

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/lib/vlang" "$pkgdir/usr/share/vlang" "$pkgdir/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/vlang/LICENSE"
  install -Dm755 v "$pkgdir/usr/lib/vlang"
  cp -a examples "$pkgdir/usr/share/vlang/"
  cp -a tools "$pkgdir/usr/share/vlang/"
  cp -a tutorials "$pkgdir/usr/share/vlang/"
  cp -a doc "$pkgdir/usr/share/vlang/"
  cp -a thirdparty "$pkgdir/usr/lib/vlang/"
  cp -a vlib "$pkgdir/usr/lib/vlang/"
  ln -s /usr/lib/vlang/v "$pkgdir/usr/bin/v"
}
# vim:set ts=2 sw=2 et: