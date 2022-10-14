# Maintainer: VCalV
_pkgname=gourou
pkgname="${_pkgname}-bin"
__pkgname="lib${_pkgname}"
pkgver=0.8
pkgrel=1
pkgdesc="Download and decrypt adobe encrypted (acsm) pdf and epub files"
arch=('x86_64')
license=('LGPL3')
url="https://indefero.soutade.fr/p/libgourou"
depends=(glibc gcc-libs zlib libzip openssl-3.0)
conflicts=(gourou gourou-git)
options=(!strip)
source=("https://indefero.soutade.fr/p/${__pkgname}/downloads/get/${__pkgname}_utils_${pkgver}.tgz")
sha512sums=(9ae25d14d209909c2eac4415fd72eb8612509c3167529bbb03f4e12ae3948f364bc387c87e75f861d929eb6664ff67ed3096d0c8316ef75bbcb58c787bb8c4e3)

package() {
	cd "${srcdir}/${__pkgname}_utils_${pkgver}"

	install -d $pkgdir/{usr/bin/,usr/lib/}
	cp -a --no-preserve=ownership {acsmdownloader,adept_activate,adept_remove} $pkgdir/usr/bin
	cp -a --no-preserve=ownership *.so $pkgdir/usr/lib
}
