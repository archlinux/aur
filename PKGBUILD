# Maintainer: Adrian Perez de Castro
pkgname=agreader
pkgdesc='Console browser for Amiga Guide format files'
pkgver=1.2
pkgrel=1
arch=(x86_64)
license=(GPL2)
url=http://aminet.net/package/misc/unix/AGReader.tar.bz2
depends=(glibc)
source=(http://aminet.net/misc/unix/AGReader.tar.bz2)
b2sums=('60476af33448acd03d136154a23a25e1f795c8810d5dfe5005eff8835c06ef1d70e9ab5ad8a726f15aa6958cc43133b92e9d58ec53e036ed1ee5d00bb8fdb4e3')

build () {
	make -C AGReader/Sources CFLAGS="${CFLAGS}" LIBS="${LDFLAGS}"
}

package () {
	install -Dm755 AGReader/Sources/agr "${pkgdir}/usr/bin/agr"
	install -Dm644 AGReader/Docs/agr.guide "${pkgdir}/usr/share/doc/${pkgname}/agr.guide"
}
