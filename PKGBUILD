# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Robert Knauer <robert@privatdemail.net
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=yapet
pkgver=2.6
pkgrel=1
pkgdesc="Yet Another Password Encryption Tool"
arch=('x86_64')
url="https://yapet.guengel.ch/"
license=('GPL')
depends=('ncurses' 'openssl' 'argon2')
makedepends=('cppunit')
source=(https://yapet.guengel.ch/downloads/$pkgname-$pkgver.tar.xz)
sha256sums=('54ca11c9c71d1bc530908f7f68d0a6021c871d283bdc1b421d8776ba8b456302')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
