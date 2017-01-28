# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=slashtime
pkgver=0.5.13
pkgrel=1
pkgdesc="A small program which displays the time in various places"
arch=('any')
url="http://research.operationaldynamics.com/projects/slashtime/"
license=('GPL')
depends=('java-gnome')
makedepends=('java-environment')
source=(http://research.operationaldynamics.com/projects/$pkgname/dist/$pkgname-$pkgver.tar.bz2)
md5sums=('abda2ed0f55095e5764655b394bcc7eb')

build() {
  cd $pkgname-$pkgver
  ./configure prefix=/usr jdk=/usr java-gnome=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
