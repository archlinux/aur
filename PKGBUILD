# Maintainer: haru_nak <uobikiemukot at gmail dot com>
pkgname=yaft
pkgver=0.2.9
pkgrel=4
pkgdesc="yet another framebuffer terminal"
arch=('i686' 'x86_64')
url="https://github.com/uobikiemukot/yaft"
license=('MIT')
makedepends=('ncurses')
optdepends=('fbv: for the yaft_wall command to work'
			'idump: for the yaft_wall command to work')
source=($url/archive/v$pkgver.tar.gz)
backup=(usr/share/terminfo/y/yaft-256color)

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
md5sums=('ddcbe929c51c453b01e3d18579b0860a')
