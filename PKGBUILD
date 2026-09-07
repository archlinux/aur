# Maintainer: Nils Van Zuijlen <nils.van-zuijlen@mailo.com>
pkgname=eqonomize-bin
pkgver=1.5.13
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
sha256sums_x86_64=('f9f1483770db969ba8ae106d69d41438d4ae3012384fea5dba48216941851681')
sha256sums_i386=('9edfffc54c76abbb8b55b4ce78fc9cc08fb1940bc1b5b3fef7acc58456189a5e')


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
