# $Id: PKGBUILD,v 1.46 2008/02/04 22:05:57 jgc Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.6.31
pkgrel=1
pkgdesc="XML parsing library, version 2"
arch=(i686 x86_64)
license=('custom')
depends=('zlib' 'readline')
makedepends=('python>=2.5')
options=('!libtool')
source=(ftp://ftp.xmlsoft.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
url="http://www.xmlsoft.org/"
md5sums=('714b0683b1ec4bdc63bc356d729f9b18')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-threads --with-history || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
