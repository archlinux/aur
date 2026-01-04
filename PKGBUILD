# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Raziman Mahathir <raziman.mahathir@gmail.com>

pkgname=gomu
pkgver=2.1.3
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
sha256sums=('ada00c9381baf65f792e8d1558b16bd9b102c55f80c1e4775624cea7499875ba')

build() {
	cd "${pkgname}-${pkgver}"
	make build
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ./bin/gomu "${pkgdir}/usr/bin/gomu"
}
