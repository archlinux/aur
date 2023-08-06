# Maintainer: Aanok <aanok.aur@gmail.com>
pkgname='jftui'
pkgver=0.7.0
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
sha256sums=('ba13249541ebaba08f6c87bb761d64d424806e6770a8b36cfd7bb7a7d546d866')

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
