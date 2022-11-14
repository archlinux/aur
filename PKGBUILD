# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bug <Bug2000@gmail.com>
# Contributor: Marcel Wysocki <maci@satgnu.net>

pkgname=pidgin-otr
pkgver=4.0.2
pkgrel=4
pkgdesc='Off-the-Record Messaging plugin for Pidgin.'
arch=('x86_64')
license=('GPL')
url='https://www.cypherpunks.ca/otr/'
depends=('libotr>=4.0.2' 'pidgin' 'perl-xml-parser')
makedepends=('intltool')
source=("https://www.cypherpunks.ca/otr/${pkgname}-${pkgver}.tar.gz"{,.asc})
md5sums=('7ef14e1334a4bc80e5d530f9a3cfc626'
         'SKIP')
sha256sums=('f4b59eef4a94b1d29dbe0c106dd00cdc630e47f18619fc754e5afbf5724ebac4'
            'SKIP')
b2sums=('e4ee9887d755f27f121c86337df596939eb1ae83ae91d1a396140be27558ee086cca54e2fb7e2337603fc78df00228e8a5759c3adc8b6c68bfdb3f3fa9476163'
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
