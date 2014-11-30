# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libpuzzle
pkgver=0.11
pkgrel=1
pkgdesc="The Puzzle library is designed to quickly find visually similar images"
arch=('i686' 'x86_64')
url="http://libpuzzle.pureftpd.org/project/libpuzzle"
license=('BSD')
depends=('gd')
source=(http://download.pureftpd.org/pub/pure-ftpd/misc/$pkgname/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('f9edc7322c6f422be395244eefbda180')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
