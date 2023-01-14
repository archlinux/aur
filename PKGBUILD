# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-bin
pkgver=1.5.4
pkgrel=1
arch=('x86_64' 'i386')
pkgdesc="Cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
license=('GPL3')
depends=('qt5-base')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source=("https://github.com/Eqonomize/Eqonomize/releases/download/v${pkgver}/eqonomize-${pkgver}-${CARCH}.tar.gz"
		"https://raw.githubusercontent.com/Eqonomize/Eqonomize/v${pkgver}/data/eqonomize.desktop"
		"https://github.com/Eqonomize/Eqonomize/raw/v${pkgver}/data/scalable/eqonomize.svg")
if [[ $CARCH == 'x86_64' ]]; then
	sha256sums=('dfab771815523c2d458e90052eb8686fca1db5ff5dd3afa50d7a271504e799b4')
elif [[ $CARCH == 'i386' ]]; then
	sha256sums=('3021651a728d5ee4ed8b6e24a9dc9a99836af07e4b5abb597ebe6c8bbd96a27e')
fi

sha256sums+=('cd59b443b26ec8467da50d2cb3e9abf462d254c40404c0d318710d0758fc92ba' '0c036f8ac76d77f1493fe9984cc36c0b7760274d2cd4b532b48e6c1fa1b9f589')

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "eqonomize" "$pkgdir/usr/bin/eqonomize"
	chmod +x "$pkgdir/usr/bin/eqonomize"

	mkdir -p "$pkgdir/usr/share/applications"
	cp "eqonomize.desktop" "$pkgdir/usr/share/applications"
	chmod +x "$pkgdir/usr/share/applications/eqonomize.desktop"

	mkdir -p "$pkgdir/usr/share/pixmaps"
	cp "eqonomize.svg" "$pkgdir/usr/share/pixmaps/eqonomize.svg"
}
