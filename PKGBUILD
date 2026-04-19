#Maintainer: Suletta Mercury <hazfen@proton.me>
pkgname=hjonkcli
pkgver=1.1
pkgrel=1
pkgdesc="cli client for hjonk.me"
arch=('x86_64' 'aarch64')
url="https://hjonk.me"
license=('Unlicense')
makedepends=('gcc' 'pkgconf')
depends=('curl' 'cjson')
options=('!debug' 'strip')
source=("hjonk.c")
sha256sums=('b7aa84b1beafad2e94814d85dfc3bbf0bc4eaffb57286242b8cf15eaa0b9f7ca')

build () {
	gcc hjonk.c -o hjonkcli \
		${CFLAGS} \
		${LDFLAGS} \
		$(pkg-config --cflags --libs libcurl libcjson)
	}
package() {
	install -Dm655 hjonkcli "${pkgdir}/usr/bin/hjonkcli"
}
