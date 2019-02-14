# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Welp, it looks like THC as an organization is kaput. It was good enough of
# VH to keep all their shit on github as the tools will continue to be in use
# for quite some time. Still compiles...

pkgname=thc-ssl-dos
pkgver=1.4
pkgrel=3
pkgdesc="THC-SSL-DOS is a tool to verify the performance of SSL by flooding connections"
url="https://github.com/vanhauser-thc/THC-Archive"
arch=('i686' 'x86_64')
install="${pkgname}.install"
license=('custom: unknown')
depends=('openssl' 'glibc' 'zlib')
source=("https://github.com/vanhauser-thc/THC-Archive/raw/master/Exploits/thc-ssl-dos-1.4.tar.gz")
sha256sums=('3e8dcaedf39a11ebaeac6e4d75175fcc724c6255904ef4e27bf72c9788119a04')

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
