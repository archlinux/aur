# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm
pkgver=0.7.8
pkgrel=1
pkgdesc="Advanced dynamic window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/bbidulock/adwm"
license=('GPL')
depends=('libxft' 'libxrandr' 'libxinerama' 'libxpm' 'startup-notification' 'libxcomposite' 'libxdamage')
optdepends=('xdg-launch: for application launching key bindings'
            'xde-ctools: for xde-run, xde-winmenu, xde-winlist and xde-wkspmenu default bindings'
            'xde-menu: for xde-menu root menu default bindings'
            'xde-session: for xde-logout and xde-xlock default bindings')
options=('!libtool')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
sha512sums=('274f9dc2a35e41dfc4e33f609c19ab558df230cf58614d2432d21da68d040acc68f35a95587a3769837cfd1258d29be17dc201b59e46ec031fd6e894d61bb5a3')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
