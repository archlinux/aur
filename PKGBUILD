# $Id: PKGBUILD,v 1.10 2008/03/30 20:48:41 eric Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=psiconv
pkgver=0.9.8
pkgrel=2
pkgdesc="Converts Psion 5(MX) files to more commonly used file formats"
arch=(i686 x86_64)
url="http://software.frodo.looijaard.name/psiconv/"
license=('GPL')
depends=('imagemagick>=6.4.0.0')
makedepends=('bc')
backup=('etc/psiconv/psiconv.conf')
options=('!libtool')
source=(http://software.frodo.looijaard.name/psiconv/files/psiconv-${pkgver}.tar.gz)
md5sums=('8d7548e3c6b9cd408544736133728acd')
sha1sums=('dd12190f96ff5fc571700b093701daad7f996ac8')

build() {
  cd ${startdir}/src/psiconv-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
