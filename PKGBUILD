# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libisds
pkgver=0.10.2
pkgrel=1
pkgdesc="Client library for accessing SOAP services of ISDS (Data Box Information System)"
arch=('i686' 'x86_64')
url="http://xpisar.wz.cz/libisds/"
license=('LGPL')
depends=('libxml2' 'expat')
source=(http://xpisar.wz.cz/$pkgname/dist/$pkgname-$pkgver.tar.xz)
sha256sums=('841137d91f8c3f87497c8c9802783361d7e41c487c0571ada4fc3a0020d059b3')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
