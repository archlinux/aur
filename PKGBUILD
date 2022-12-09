# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname='jftui'
pkgver=0.6.1
pkgrel=1
pkgdesc="TUI client for Jellyfin based on mpv"
arch=('x86_64')
url="https://github.com/Aanok/jftui"
license=('Unlicense')
makedepends=('gcc' 'pkgconf' 'make')
depends=('mpv' 'yajl' 'curl')
provides=("${pkgname}")
conflicts=('jftui-git')
source=("https://github.com/Aanok/jftui/archive/v${pkgver}.tar.gz")
sha256sums=('cd19e367503e8e4cd4c0fe9ff8dcb48cdc34b5b721ba0a526f963c1628673099')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/clang/gcc/' Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
