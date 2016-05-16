# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libisds
pkgver=0.10.3
pkgrel=1
pkgdesc="Client library for accessing SOAP services of ISDS (Data Box Information System)"
arch=('i686' 'x86_64')
url="http://xpisar.wz.cz/libisds/"
license=('LGPL')
depends=('libxml2' 'expat')
source=(http://xpisar.wz.cz/$pkgname/dist/$pkgname-$pkgver.tar.xz)
sha256sums=('224c36bcdab005635fe3bdf35edbb06e330e1f5d4defe295649e54b8507bb7c4')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
