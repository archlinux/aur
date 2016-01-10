# Maintainer: jjacky
pkgname=anopa
pkgver=0.4.0
pkgrel=1
pkgdesc="init system/service manager built around s6 supervision suite"
arch=('i686' 'x86_64')
url="http://jjacky.com/anopa"
license=('GPL3+')
depends=('execline' 's6')
makedepends=('skalibs')
source=(http://jjacky.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('02987f834b77c1b9c3f06ec2e9ed9b705c219d549c016231c65eaca18639ef5a')

build() {
  cd "$pkgname-$pkgver"
  ./configure --bindir=/usr/bin --libexecdir=/usr/lib/anopa
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
