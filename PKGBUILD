# Maintainer: Andreas Nüßlein <nutz@noova.de>

pkgname=check_pidfile
pkgver=1
pkgrel=0
pkgdesc="check pidfile"
arch=('i686' 'x86_64')
depends=('monitoring-plugins')
url="https://github.com/hollow/check_pidfile.git"
source=("git+https://github.com/hollow/check_pidfile.git")
md5sums=('SKIP')

build() {
  cd "$pkgname"
  autoreconf -vi
  ./configure
  make
}

package() {
  cd "$pkgname"
  install -Dm4755 check_pidfile "$pkgdir/usr/lib/monitoring-plugins/check_pidfile"
}

# vim: ft=sh syn=sh
