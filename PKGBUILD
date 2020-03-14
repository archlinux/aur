# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Robert Knauer <robert@privatdemail.net
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=yapet
pkgver=2.3
pkgrel=1
pkgdesc="Yet Another Password Encryption Tool"
arch=('x86_64')
url="https://yapet.guengel.ch/"
license=('GPL')
depends=('ncurses' 'openssl')
makedepends=('cppunit')
source=(https://yapet.guengel.ch/downloads/$pkgname-$pkgver.tar.xz)
sha256sums=('f50e6a042cd636a5727dd4d01b9154231197a209e744d39a1585ea1bf6d184ba')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
