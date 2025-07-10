# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Petar Benke <makepkg@benke.co.uk>

pkgname=cutmp3
pkgver=4.0
pkgrel=1
pkgdesc="Edit mp3 (and mp2) files without quality loss"
arch=('any')
url="https://www.puchalla-online.de/cutmp3.html"
license=('GPL')
depends=('readline')
source=("https://github.com/tarjanm-movidius/cutmp3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea30f42fe462b5fdec7efc5510cae740f3f3ea007758cffcfa6cdb95657728b3')

build() {
	cd "${pkgname}-${pkgver}"
	export LDFLAGS="-lm -lreadline -Wl,--no-as-needed"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make PREFIX="${pkgdir}/usr" install
}
