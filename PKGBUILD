# Maintainer: jjacky
pkgname=anopa
pkgver=0.5.0
pkgrel=1
pkgdesc="init system/service manager built around s6 supervision suite"
arch=('i686' 'x86_64')
url="https://jjacky.com/anopa"
license=('GPL3+')
depends=('execline' 's6')
makedepends=('skalibs')
source=(https://jjacky.com/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('a9f3f7024220c665e11853cde6371907d92752b73bf3524ef1f3746b51705d89')

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
