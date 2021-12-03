# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm
pkgver=0.7.12
pkgrel=2
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/adwm"
license=('GPL')
depends=('libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'libxcomposite' 'libxdamage' 'libpng')
optdepends=('xdg-launch: for application launching key bindings'
            'xde-ctools: for xde-run, xde-winmenu, xde-winlist and xde-wkspmenu default bindings'
            'xde-menu: for xde-menu root menu default bindings'
            'xde-session: for xde-logout and xde-xlock default bindings')
options=('!libtool')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha512sums=('2ad47c54545f27aaf126e28529b0b16465d9c968814816e7389b16572791b9bcd5810ba59d7e3481b611c62b75317235fe33f6e1766ac14f2efcdd74469aa45c')

build() {
  cd $pkgname-$pkgver
  ./configure
  make CFLAGS="$CFLAGS -Wno-format-security"
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
