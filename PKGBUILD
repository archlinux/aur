# Maintainer: Jack Wu <origincoder@yahoo.com>
pkgname=bilibili-live-helper
pkgver=1.1.2
pkgrel=1
pkgdesc="Helper for Bilibili Live."
arch=('x86_64')
url="https://github.com/pandaGao/bilibili-live-helper"
install=${pkgname}.install
license=('MIT')
depends=()
makedepends=('tar' 'git')
build() {
	git clone https://github.com/OriginCode/AURFiles
	cp ./AURFiles/${pkgname}.tar.gz .
	tar xvf ./${pkgname}.tar.gz
}
package() {
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/bin/"
	cp -r bilibili-live-helper/* "${pkgdir}/opt/${pkgname}"
	ln -s "${pkgdir}/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

