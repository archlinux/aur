# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mem-suspend
pkgver=1
pkgrel=2
pkgdesc="A script for suspending to memory"
arch=('x86_64')
license=('custom:WTFPL')
source=("mem-suspend.c")
sha256sums=('eeb52c2efe5896d6001cf9c710d0c9824f9e60342ab3297edcdfaf3aa7329ef8')

build() {
  cd "$srcdir"
  gcc mem-suspend.c -o mem-suspend
}

package() {
  cd "$srcdir"
  install -Dm750 -gpower mem-suspend "$pkgdir/usr/bin/mem-suspend"
  chmod u+s "$pkgdir/usr/bin/mem-suspend"
}
