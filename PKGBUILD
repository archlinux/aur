# $Id: PKGBUILD,v 1.1 2005/11/08 09:39:49 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=aiksaurus
pkgver=1.2.1
pkgrel=1
pkgdesc="A cross-platform, open-source thesaurus"
url="http://aiksaurus.sourceforge.net/"
license="GPL"
depends=('gtk2')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('3eae03b7c49843ccc9262e52846ea6b4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gtk
  make || return 1
  make DESTDIR=${startdir}/pkg install
  find ${startdir}/pkg -name '*.la' -exec rm {} \;
}
