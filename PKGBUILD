# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=mem-suspend
pkgver=1
pkgrel=2
pkgdesc="A script for suspending to memory"
arch=('x86_64')
license=('custom:WTFPL')
source=("mem-suspend.c")
sha256sums=('42f0e60edacf574e2f542fea746c4c59a558a2f816d7c37c30bb5fb6cc03d364')

build() {
  cd "$srcdir"
  gcc mem-suspend.c -o mem-suspend
}

package() {
  cd "$srcdir"
  install -Dm750 -gpower mem-suspend "$pkgdir/usr/bin/mem-suspend"
  chmod u+s "$pkgdir/usr/bin/mem-suspend"
}
