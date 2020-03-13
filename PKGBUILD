# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ispc-bin
pkgver=1.12.0
pkgrel=2
pkgdesc="Intel SPMD program compiler"
arch=('x86_64')
url="https://ispc.github.io/"
license=('BSD')
source=("ispc-v$pkgver-linux.tar.gz::https://sourceforge.net/projects/ispcmirror/files/v$pkgver/ispc-v$pkgver-linux.tar.gz/download")
sha256sums=('79decaef42bc5433ab30f5879eb91af14473a42e8b51ec727a97f61ee918497e')


package() {
  cd "ispc-v$pkgver-linux"

  install -Dm755 "bin/ispc" -t "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/doc/ispc"
  mv *.html "$pkgdir/usr/share/doc/ispc"
  mv "css" "$pkgdir/usr/share/doc/ispc"
  mv "examples" "$pkgdir/usr/share/doc/ispc"
  install -Dm644 "ReleaseNotes.txt" -t "$pkgdir/usr/share/doc/ispc"

  install -Dm644 "contrib/ispc.vim" -t "$pkgdir/usr/share/vim/vimfiles/syntax"

  install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/ispc"
}
