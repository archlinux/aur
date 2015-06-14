# Maintainer: another <code § deadcode § eu>
# Contributor: (unknown)
pkgname=bitmap
pkgver=1.0.8
pkgrel=2
pkgdesc="X-bitmap (XBM) editor and converter utilities"
arch=('i686' 'x86_64')
url="http://www.x.org/"
license=('MIT')
depends=('libxaw>=1.0.7')
makedepends=('xbitmaps')
source=("http://ftp.x.org/pub/individual/app/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1a2fbd10a2ca5cd93f7b77bbb0555b86d8b35e0fc18d036b1607c761755006fc')
sha384sums=('6c563594855a8b2eb5209ea7ecde5de46ddfa8c56c79651a966329a288b7c8a7d3e932acdac4777cb32d40580cac4dde')
sha512sums=('08d676495abe58a9be4cdebbb6fec88fe6dd5c196061713ac607f2222ae8f66e4dc7f6f7a1c35b8a30417ee1a8437b92b61229ef15e6ba1f4baead892d4b0927')

build(){
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
	install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
