# Maintainer: Arsen Musayelyan <arsen@arsenm.dev>
pkgname=permafrost-git
pkgver=r2.d9fc3a8
pkgrel=1
pkgdesc="Lightweight single-site browser generator using Webview or Chrome/Chromium."
arch=('any')
license=('GPLv3')
makedepends=('go')
source=('git+https://gitea.arsenm.dev/Arsen6331/permafrost.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/permafrost"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/permafrost"
	make
}

package() {
	cd "$srcdir/permafrost"
	make PREFIX="$pkgdir" install
}
