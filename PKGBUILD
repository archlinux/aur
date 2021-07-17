# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=ispc-bin
pkgver=1.16.1
pkgrel=1
pkgdesc="Intel SPMD program compiler"
arch=('x86_64')
url="https://ispc.github.io/"
license=('BSD')
depends=('glibc')
provides=('ispc')
conflicts=('ispc')
source_x86_64=("ispc-v$pkgver-linux.tar.gz::https://github.com/ispc/ispc/releases/download/v$pkgver/ispc-v$pkgver-linux.tar.gz")
sha256sums_x86_64=('88db3d0461147c10ed81053a561ec87d3e14265227c03318f4fcaaadc831037f')


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
