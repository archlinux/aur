# Maintainer: tyrolyean <tyrolyean@tyrolyean.net>
# Co-Maintainer: danihek <danihek07@gmail.com>
pkgname=hellwal
pkgver=1.0.3
pkgrel=1
pkgdesc="fast, extensible color palette generator"
arch=('i686' 'x86_64' 'arm' 'aarch64' 'riscv')
url="https://github.com/danihek/hellwal"
license=('MIT')
makedepends=('make')
source=(
	"https://github.com/danihek/${pkgname}/archive/refs/tags/v${pkgver}/v${pkgver}.tar.gz"
	)

sha256sums=(
	'2b841d03fe057e30cd1200283361f5ca2f0320aaf2ae7828ace3ce6721633ea8'
	)

sha512sums=(
	'87c365d8619e20cbacac8a1ad34f860fb5699e9b86d6dc50c62de5877a743d745f6924130e6fc012ff974e0acc2002d947ba1a47b32dea7983aa56f6dbdb1800'
	)

md5sums=(
	'392eaaf1b831e5d18ab9fe6bc4e4fd3b'
	)

build() {
	cd ${pkgname}-${pkgver}
	make ${pkgname}
}

package() {
	install -D ${pkgname}-${pkgver}/${pkgname} $pkgdir/usr/bin/${pkgname}
	install -d $pkgdir/usr/share/docs/${pkgname}/templates/
	install -D ${pkgname}-${pkgver}/templates/* $pkgdir/usr/share/docs/${pkgname}/templates/
	install -d $pkgdir/usr/share/docs/${pkgname}/themes/
	install -D ${pkgname}-${pkgver}/themes/* $pkgdir/usr/share/docs/${pkgname}/themes/
}
