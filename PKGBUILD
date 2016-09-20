# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=gliv
pkgver=1.9.7
pkgrel=3
pkgdesc='OpenGL image viewer'
arch=('i686' 'x86_64')
url='http://guichaz.free.fr/gliv/'
license=('GPL')
depends=('gtkglext')
source=(http://guichaz.free.fr/gliv/files/$pkgname-$pkgver.tar.bz2)
sha256sums=('5be6d071927dcb371676a9e4e9e4c54e8b2f4842f04dd63727b9a5032ddbcb69')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
} 

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
