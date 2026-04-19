#Maintainer: Suletta Mercury <hazfen@proton.me>
pkgname=hjonkcli
pkgver=1.0
pkgrel=1
pkgdesc="cli client for hjonk.me"
arch=('x86_64' 'aarch64')
url="https://hjonk.me"
license=('Unlicense')
makedepends=('gcc' 'pkgconf')
depends=('curl' 'cjson')
options=('!debug' 'strip')
source=("hjonk.c")
sha256sums=('42a4c1cbab8b96ebd0f52dc29d7eaa579c30d1f94d31cd42affcadade6de4ad4')

build () {
	gcc hjonk.c -o hjonkcli \
		${CFLAGS} \
		${LDFLAGS} \
		$(pkg-config --cflags --libs libcurl libcjson)
	}
package() {
	install -Dm655 hjonkcli "${pkgdir}/usr/bin/hjonkcli"
}
