pkgname=brooklynn-monitor-git
pkgver=1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/FedGuy699/Brooklynn-Monitor"
license=('MIT')
depends=('xorg-server')
makedepends=('git' 'gcc' 'make')
source=("$pkgname::git+$url")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  g++ -O2 -o brooklynn-monitor monitor.cpp -lX11
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 brooklynn-monitor "$pkgdir/usr/bin/brooklynn-monitor"
  install -Dm644 brooklynn-monitor.desktop "$pkgdir/usr/share/applications/brooklynn-monitor.desktop"
}