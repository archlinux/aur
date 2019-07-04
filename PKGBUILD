pkgname=mem-suspend
pkgver=1
pkgrel=2
pkgdesc="A script for suspending to memory"
arch=('any')
license=('custom:WTFPL')
source=("mem-suspend.c")
sha256sums=('73d599b79461e72d1963be5ddb6f7026b53705dbee523a48106eea0d5dfd000d')

build() {
  cd "$srcdir"
  gcc mem-suspend.c -o mem-suspend 
}

package() {
  install -Dm750 -gpower "$srcdir/mem-suspend" "$pkgdir/usr/bin/mem-suspend"
  chmod u+s "$pkgdir/usr/bin/mem-suspend"
}
