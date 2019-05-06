# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=powwow
pkgver=1.2.19
pkgrel=1
pkgdesc="A mud client based on cancan which was inspired by tintin"
arch=('i686' 'x86_64')
url="http://www.hoopajoo.net/projects/powwow.html"
license=('GPL')
source=(http://www.hoopajoo.net/static/projects/$pkgname-$pkgver.tar.gz)
sha256sums=('9e27b62ea9e0c70824dcaa98dd5f4bc07d11075f197fe8a9c6c2b80a87a13283')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man --enable-sort --enable-ansibug
  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
