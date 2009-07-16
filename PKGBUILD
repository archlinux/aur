# $Id: PKGBUILD,v 1.1 2008/08/23 05:01:01 allan Exp $
# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: Bug <Bug2000@gmail.com>
# Contributor: Marcel Wysocki <maci@satgnu.net>

pkgname=pidgin-otr
pkgver=3.2.0
pkgrel=1
pkgdesc="Off-the-Record Messaging plugin for Pidgin"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.cypherpunks.ca/otr/"
depends=('libotr>=3.2.0' 'pidgin' 'perlxml')
source=("http://www.cypherpunks.ca/otr/${pkgname}-${pkgver}.tar.gz")
md5sums=('8af70b654b7d7c5a5b7785699ff562f9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
