# Maintainer: augety <zj.wang.work@zohomail.cn>

pkgname=augety-dwm
pkgbase=augety-dwm
pkgver=6.5
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://augety.net/augety/dwm"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'imlib2')
source=(dwm.desktop
  "$pkgname::git+http://augety.net/augety/dwm.git")
sha256sums=('bc36426772e1471d6dd8c8aed91f288e16949e3463a9933fee6390ee0ccd3f81'
  'SKIP')

build() {
  cd "$srcdir/$pkgname"
  make 
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "../../dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
}
