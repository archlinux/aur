# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Laszlo Papp <djszapi2 at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=gxemul
pkgver=0.6.0.1
pkgrel=1
pkgdesc='An instruction-level emulator capable of ARM, MIPS, PowerPC, and SuperH'
arch=('i686' 'x86_64')
url='http://gxemul.sourceforge.net/'
license=('GPL')
depends=('libx11')
source=("http://gxemul.sourceforge.net/src/gxemul-0.6.0.1.tar.gz")
md5sums=('bfdc4109ddd05361be0db0084dd3dbed')

build() {
  cd ${pkgname}-${pkgver}

  ./configure

  make
}

package() {
  cd ${pkgname}-${pkgver}
  echo ${pkgdir}

  sed -i 's_$(DESTDIR)$(MANDIR)/man1_$(PREFIX)/share/man/man1_' Makefile

  make PREFIX=${pkgdir}/usr install

  #install -Ds -m755 gxemul ${pkgdir}/usr/bin/gxemul
  #install -d ${pkgdir}/usr/share/licenses/${pkgname}/
  #install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
md5sums=('a66794710e930f43fef8cb9a734dc7d3')
