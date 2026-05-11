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
sha256sums=('d2d1a0048efad8298a9a12df61475d3d117ee33c2271677cced316b11354d9d3')

build () {
	gcc hjonk.c -o hjonkcli \
		${CFLAGS} \
		${LDFLAGS} \
		$(pkg-config --cflags --libs libcurl libcjson)
	}
package() {
	install -Dm655 hjonkcli "${pkgdir}/usr/bin/hjonkcli"
}
