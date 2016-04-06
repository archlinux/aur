# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=dumpet
pkgver=2.1
pkgrel=5
pkgdesc="A tool for debugging El Torito boot images."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/dumpet/"
license=('GPL2')
install=
changelog=
source=("https://fedorahosted.org/releases/d/u/dumpet/${pkgname}-${pkgver}.tar.bz2"
	"${pkgname}-${pkgver}.tar.bz2.sig")
noextract=()
sha512sums=('ca12d0852594acabda6a97b91e072872a6d83cd29b9c549a2f03120a8e92b19d1254ac229e27b562c5b0439b92daeec54e95df0282af4cd346e66b876d4a33b3'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
