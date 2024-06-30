# Maintainer: balaraz <balaraz@tuta.io>

pkgname=mmv-c
pkgver=0.1
pkgrel=1
pkgdesc="Rename multiple files with editor like to mmv-go"
license=(MIT)
url='https://github.com/mcauley-penney/mmv-c/'
arch=(x86_64)
depends=(glibc)
makedepends=(make gcc)
provides=(mmv)
conflicts=(mmv-c-git mmv mmv-go)
source=("${pkgname}.zip::${url}/archive/refs/heads/main.zip")
sha256sums=("SKIP")

package() {
		cd ./mmv-c-main

		make > /dev/null

		install -Dm755 ./mmv -t ${pkgdir}/usr/bin

		install -Dm644 ./man/mmv.1.gz -t ${pkgdir}/usr/share/man/man1
		install -Dm644 ./LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
}
