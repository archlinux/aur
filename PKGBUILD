# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=powwow
pkgver=1.2.17
pkgrel=1
pkgdesc="A mud client based on cancan which was inspired by tintin"
arch=('i686' 'x86_64')
url="http://www.hoopajoo.net/projects/powwow.html"
license=('GPL')
source=(http://www.hoopajoo.net/static/projects/$pkgname-$pkgver.tar.gz)
sha256sums=('e8dee1fe9cd6b59cfa20e3e7ef4eb49775b72b80d1d298e23172337cbc78baf6')

build() {
  cd ${srcdir}/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --enable-sort --enable-ansibug
  make
}

package () {
  cd ${srcdir}/$pkgname-$pkgver

  make DESTDIR=${pkgdir} install
}
