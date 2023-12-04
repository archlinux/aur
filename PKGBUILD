# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Raziman Mahathir <raziman.mahathir@gmail.com>

pkgname=gomu
pkgver=2.1.2
pkgrel=2
pkgdesc="Terminal User Interface (TUI) Music Player"
arch=('x86_64')
url="https://github.com/issadarkthing/gomu"
license=('GPL')
depends=('alsa-lib' 'youtube-dl')
makedepends=('go' 'git')
optdepends=('fzf')
conflicts=('gomu-git' 'gomu-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/issadarkthing/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('697d4a99ed6602b7839f8dfa48c2f80fccee5cf74d3d619cc55547d610d1e592')

build() {
	cd "${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ./bin/gomu "${pkgdir}/usr/bin/gomu"
}
