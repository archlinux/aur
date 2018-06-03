# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Ewoud Nuyts <ewoud.nuyts@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gliv
pkgver=1.9.7
pkgrel=5
pkgdesc='OpenGL image viewer'
arch=('i686' 'x86_64')
url='http://guichaz.free.fr/gliv/'
license=('GPL')
depends=('gtkglext')
source=("http://guichaz.free.fr/gliv/files/$pkgname-$pkgver.tar.bz2")
sha1sums=('b040a08ac81d17e7dd872d67662378f4f95f7820')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" datadir="$pkgdir"/usr/share install
}
