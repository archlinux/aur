# Maintainer: Viachaslau Khalikin <khalikin'at'yandex>

_pkgbase=dwmstatus
pkgname=dwmstatus-git
pkgver=r4.51bc02f
pkgrel=1
pkgdesc="A simple dwm status application in C"
arch=('x86_64')
url="https://git.suckless.org/dwmstatus"
license=('MIT')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
depends=('libx11')
source=("git+https://git.suckless.org/dwmstatus")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd $_pkgbase
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
