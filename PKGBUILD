# Maintainer: Genstar <genstar@disroot.org>
pkgname=matrix-3ds-sdk-git
pkgver=r34.8b4315c
pkgrel=1
pkgdesc="Matrix client SDK for the Nintendo 3DS"
arch=('x86_64')
url="https://github.com/Sorunome/matrix-3ds-sdk/"
license=('Apache')
makedepends=('git' '3ds-curl' '3ds-jansson')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git+https://github.com/Sorunome/matrix-3ds-sdk.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
