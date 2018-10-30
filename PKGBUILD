# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
pkgname=libdasm
pkgver=1.6r15
pkgrel=1
pkgdesc="a disassembly library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libdasm/"
license=('custom:Public Domain') # a modifier
depends=()
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/libdasm/libdasm-beta.zip")
md5sums=('573944eacf5c942644b538926c217b95')

build() {
  cd "$srcdir/"
  
  make
}

package() {
  install -D -m644 libdasm.h  $pkgdir/usr/include/libdasm.h
  install -D -m755 libdasm.so $pkgdir/usr/lib/libdasm.so
  install -D -m755 examples/das $pkgdir/usr/bin/das
  cd $pkgdir/usr/lib/
  ln -s libdasm.so libdasm.so.1.0
}

# vim:set ts=2 sw=2 et:
