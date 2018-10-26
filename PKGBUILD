# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Robert Knauer <robert@privatdemail.net
# Contributor: rich_o <rich_o@lavabit.com>
# Contributor: teddy_beer_maniac <teddy_beer_maniac@wp.pl>

pkgname=yapet
pkgver=2.0
pkgrel=1
pkgdesc="Yet Another Password Encryption Tool"
arch=('i686' 'x86_64')
url="http://www.guengel.ch/myapps/yapet/"
license=('GPL')
depends=('ncurses' 'openssl')
makedepends=('cppunit')
source=(http://www.guengel.ch/myapps/yapet/downloads/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('2a2492ab234098cc2223a1273d70fec0f7f57e70580b6a8a12bacc9a176506c6')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
