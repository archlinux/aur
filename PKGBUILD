# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Raziman Mahathir <raziman.mahathir@gmail.com>

pkgname=gomu
pkgver=2.1.4
pkgrel=1
pkgdesc="Terminal User Interface (TUI) Music Player"
arch=('x86_64')
url="https://github.com/issadarkthing/gomu"
license=('GPL')
depends=('alsa-lib' 'youtube-dl')
makedepends=('go' 'git')
optdepends=('fzf')
conflicts=('gomu-git' 'gomu-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/issadarkthing/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('39d5792cc2ecb34900e12814d8859ccbefe1a7e124c827315c0445ddf45c2ea0')

build() {
	cd "${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ./bin/gomu "${pkgdir}/usr/bin/gomu"
}
