# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=adwm
pkgver=0.7.4
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
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha512sums=('8e9624f05ec526be02c6ca95967bd549d49d988f453b0f09e555a4a3b012773c3b238f60755ce80eaab13f22b354f8a4235bc1e5e2a3375b42993bc0023e7e73')

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
