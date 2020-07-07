# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bug <Bug2000@gmail.com>
# Contributor: Marcel Wysocki <maci@satgnu.net>

pkgname=pidgin-otr
pkgver=4.0.2
pkgrel=3
pkgdesc='Off-the-Record Messaging plugin for Pidgin.'
arch=('x86_64')
license=('GPL')
url='https://www.cypherpunks.ca/otr/'
depends=('libotr>=4.0.2' 'pidgin' 'perl-xml-parser')
makedepends=('intltool')
source=("https://www.cypherpunks.ca/otr/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('7ef14e1334a4bc80e5d530f9a3cfc626'
         'SKIP')
validpgpkeys=(22DF3305DF56667CE15784FCF24DE08F42C2ABAD) # OTR Dev Team

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
