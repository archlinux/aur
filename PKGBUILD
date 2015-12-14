# Original Maintainer: Testuser_01 <arch@nico-siebler.de>
# really shit PKGBUILD fixed by: GI_Jack <iamjacksemail@hackermail.com>

# I have no idea why there were so many explicit warnings about the dangers of
# improperly using netsec tools in the original uncleaned PKGBUILD from AUR3.
# needless to say they were removed.

pkgname=thc-ssl-dos
pkgver=1.4
pkgrel=2
pkgdesc="THC-SSL-DOS is a tool to verify the performance of SSL by flooding connections"
url="http://www.thc.org/${pkgname}/"
arch=('i686' 'x86_64')
install="${pkgname}.install"
license=('custom: unknown')
depends=('openssl' 'glibc' 'zlib')
source=("http://www.thc.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0d75fc5d6aaf22130c57436fea3ca339')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return 1
	./configure --prefix=/usr || return 1
	make all || return 1
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return 1
	mkdir -p "${pkgdir}/usr/bin/" || return 1
	install -m755 -D "src/${pkgname}" "${pkgdir}/usr/bin/" || return 1
}
