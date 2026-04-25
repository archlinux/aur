#Maintainer: Suletta Mercury <hazfen@proton.me>
pkgname=hjonkcli
pkgver=1.2
pkgrel=1
pkgdesc="cli client for hjonk.me"
arch=('x86_64' 'aarch64')
url="https://hjonk.me"
license=('Unlicense')
makedepends=('gcc' 'pkgconf')
depends=('curl' 'cjson')
options=('!debug' 'strip')
source=("hjonk.c")
sha256sums=('9c7714616738f686920692c12ce4810c378fd5f25efb2e0cb16d013b8339b8da')

build () {
	gcc hjonk.c -o hjonkcli \
		${CFLAGS} \
		${LDFLAGS} \
		$(pkg-config --cflags --libs libcurl libcjson)
	}
package() {
	install -Dm655 hjonkcli "${pkgdir}/usr/bin/hjonkcli"
}
