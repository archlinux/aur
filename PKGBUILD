# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-bin
pkgver=1.5.12
pkgrel=1
arch=('x86_64' 'i386')
pkgdesc="Cross-platform personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.github.io/"
license=('GPL3')
depends=('qt5-base')
optdepends=('qt5-charts: charts in the statistics')
provides=('eqonomize')
conflicts=('eqonomize')
source_x86_64=("https://github.com/Eqonomize/Eqonomize/releases/download/v${pkgver}/eqonomize-${pkgver}-x86_64.tar.gz")
source_i386=("https://github.com/Eqonomize/Eqonomize/releases/download/v${pkgver}/eqonomize-${pkgver}-i386.tar.gz")
source=("eqonomize.desktop::https://raw.githubusercontent.com/Eqonomize/Eqonomize/v${pkgver}/data/eqonomize.desktop"
        "eqonomize.svg::https://github.com/Eqonomize/Eqonomize/raw/v${pkgver}/data/scalable/eqonomize.svg")
sha256sums=('cd59b443b26ec8467da50d2cb3e9abf462d254c40404c0d318710d0758fc92ba'
            '0c036f8ac76d77f1493fe9984cc36c0b7760274d2cd4b532b48e6c1fa1b9f589')
sha256sums_x86_64=('47d736fe86f5338a61b7a2908d69d476ef5d6cdf8582c36888fd0695db5fbbe8')
sha256sums_i386=('503d2c22a5d8c298bc3341e39dcd61ea8d8d0f3db47839807f74f7072623cf33')


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
