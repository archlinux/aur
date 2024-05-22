# Maintainer: Techflash <officialTechflashYT@gmail.com>
pkgname=commandmoney
pkgver=0.0.1
pkgrel=1
pkgdesc='Simple money management program written in Go - CLI backend'
url='https://github.com/owenrummage/CommandMoney'
arch=('x86_64')
makedepends=('go')

source=(
    "${pkgname}_$pkgver.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=('422df6a54826a98911dd8c4dbdce1272d6305314cb7ccd8eab130cc1135be9e3ff0317ba4f4bbc43c71d70d4d5a9054c5c1c65f973a5ec1d1789cc39abcb8c75')

build() {
	cd CommandMoney-${pkgver}
	go build -C src -o ../bin/money
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	mv CommandMoney-${pkgver}/bin/money ${pkgdir}/usr/bin
	chown root:root ${pkgdir}/usr/bin/money
	chmod 755 ${pkgdir}/usr/bin/money
}
