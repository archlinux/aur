# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mem-suspend
pkgver=1
pkgrel=2
pkgdesc="A script for suspending to memory"
arch=('x86_64')
license=('custom:WTFPL')
source=("mem-suspend.c")
sha256sums=('e0b58463e54d2b34c0a852daaddc50db120ecb9f52fd15bafa863abf6f122700')

build() {
  cd "$srcdir"
  gcc mem-suspend.c -o mem-suspend
}

package() {
  cd "$srcdir"
  install -Dm750 -gpower mem-suspend "$pkgdir/usr/bin/mem-suspend"
  chmod u+s "$pkgdir/usr/bin/mem-suspend"
}
