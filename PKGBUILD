# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
pkgver=0.5.1
pkgrel=2
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs qt5-base zlib libzip openssl)
conflicts=(gourou)
options=(!strip)
source=("https://indefero.soutade.fr/p/${__pkgname}/downloads/get/${__pkgname}_utils_${pkgver}.tgz")
md5sums=(3500e207aabfe591cbfde15e818d7ffe)

package() {
	cd "${srcdir}/${__pkgname}_utils_${pkgver}"

	install -d $pkgdir/{usr/bin/,usr/lib/}
	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove} $pkgdir/usr/bin
	cp -a --no-preserve=ownership *.so $pkgdir/usr/lib
}
