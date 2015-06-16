# Maintainer: kevku <kevku@gmx.com>
pkgname=rabcdasm-git
pkgver=1.17.r0.gfe93f5e
pkgrel=1
pkgdesc="Robust ABC (ActionScript Bytecode) [Dis-]Assembler"
arch=('x86_64' 'i686')
url="https://github.com/CyberShadow/RABCDAsm"
license=('GPL3')
depends=('xz')
makedepends=('git' 'dmd' 'dtools' 'libphobos-devel')
source=("$pkgname::git+git://github.com/CyberShadow/RABCDAsm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  dmd -run build_rabcdasm.d
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 rabcasm $pkgdir/usr/bin/rabcasm
  install -Dm755 rabcdasm $pkgdir/usr/bin/rabcdasm
  install -Dm755 abcexport $pkgdir/usr/bin/abcexport
  install -Dm755 abcreplace $pkgdir/usr/bin/abcreplace
  install -Dm755 swfbinexport $pkgdir/usr/bin/swfbinexport
  install -Dm755 swfbinreplace $pkgdir/usr/bin/swfbinreplace
  install -Dm755 swfdecompress $pkgdir/usr/bin/swfdecompress
  install -Dm755 swf7zcompress $pkgdir/usr/bin/swf7zcompress
  install -Dm755 swflzmacompress $pkgdir/usr/bin/swflzmacompress

}

# vim:set ts=2 sw=2 et:
