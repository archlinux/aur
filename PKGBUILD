# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: kfgz <kfgz at interia dot pl>

pkgname=nbench-byte
pkgver=2.2.3
pkgrel=3
pkgdesc="A CPU benchmark utility"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.tux.org/~mayer/linux/bmark.html"
license=('unknown')
options=(!makeflags)
source=(https://fossies.org/linux/misc/${pkgname}-${pkgver}.tar.gz
        Makefile
        nbench)
md5sums=(285dfab361080759d477ea1fe7d3093a
         3e0850abdaa162c2b2aa05315a98fa24
         7db5ab75dbe53578069f708d787fc437) 

build() {
  cp Makefile "${srcdir}"/${pkgname}-${pkgver}
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  install -dm755 "${pkgdir}"/usr/{bin,share/doc/${pkgname}}	
  install -m755 nbench "${pkgdir}"/usr/bin/nbench-byte
  install -m755 "${srcdir}"/nbench "${pkgdir}"/usr/bin
  install -m644 NNET.DAT "${pkgdir}"/usr/bin
  install -m644 bdoc.txt "${pkgdir}"/usr/share/doc/${pkgname}
  install -m644 Changes "${pkgdir}"/usr/share/doc/${pkgname}
}
