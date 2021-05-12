# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libdatovka
pkgver=0.1.1
pkgrel=1
pkgdesc="ISDS client library"
arch=('x86_64')
url="https://www.datovka.cz/cs/pages/libdatovka.html"
license=('LGPL')
depends=('libxml2' 'openssl' 'curl')
makedepends=('docbook-xsl')
source=(https://secure.nic.cz/files/datove_schranky/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('44087c07a9ba96990d6dab56913686fd95be53d851b3751a81972599f4238d46')

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
