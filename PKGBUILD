pkgname=mem-suspend
pkgver=1
pkgrel=2
pkgdesc="A script for suspending to memory"
arch=('x86_64')
license=('custom:WTFPL')
source=("mem-suspend.c")
sha256sums=('4d4dfdcb7e5aa9b65489a28dd80e1a146fbc5d52034a938ccd0ee46ad744815c')

build() {
  cd "$srcdir"
  gcc mem-suspend.c -o mem-suspend 
}

package() {
  install -Dm750 -gpower "$srcdir/mem-suspend" "$pkgdir/usr/bin/mem-suspend"
  chmod u+s "$pkgdir/usr/bin/mem-suspend"
}
