# Maintainer: Brodi <me@brodi.space>
pkgname=aretext-git
pkgver=0.r531
pkgrel=1
pkgdesc="Minimalist text editor that never slows you down."
arch=("x86_64")
url="https://github.com/aretext/aretext"
license=(GPL3)
arch=(x86_64 i686)
depends=(go)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("${pkgname}::git+${url}")
sha512sums=(SKIP)

pkgver () {
	cd "${pkgname}"
	echo "0.r$(git rev-list --count HEAD)"
}

build() {
	cd "${pkgname}"
	make build
}

package() {
	cd "${pkgname}"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
