# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libisds
pkgver=0.11.1
pkgrel=1
pkgdesc="Client library for accessing SOAP services of ISDS (Data Box Information System)"
arch=('i686' 'x86_64')
url="http://xpisar.wz.cz/libisds/"
license=('LGPL')
depends=('libxml2' 'expat')
makedepends=('docbook-xsl')
source=(http://xpisar.wz.cz/$pkgname/dist/$pkgname-$pkgver.tar.xz{,.asc})
validpgpkeys=('4B528393E6A3B0DFB2EF3A6412C9C5C767C6FAA2') # Petr Pisar
sha256sums=('c11f2f86440057f6a532072fe75f204ff1d19ecd46a4daccd6d3a1730ba03bd8'
            'SKIP')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr \
              --with-docbook-xsl-stylesheets=/usr/share/xml/docbook/xsl-stylesheets-1.79.2
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
