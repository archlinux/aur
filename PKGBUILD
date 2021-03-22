# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Robert Knauer <robert@privatdemail.net
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=yapet
pkgver=2.5
pkgrel=1
pkgdesc="Yet Another Password Encryption Tool"
arch=('x86_64')
url="https://yapet.guengel.ch/"
license=('GPL')
depends=('ncurses' 'openssl' 'argon2')
makedepends=('cppunit')
source=(https://yapet.guengel.ch/downloads/$pkgname-$pkgver.tar.xz)
sha256sums=('af518e6f76fda72eef0530e431b54b8d252b4dd6b10c7d7765a9089f9b5ef142')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
