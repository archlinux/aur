# Maintainer: evertonstz
pkgname=wiibafu
pkgver=1.2
pkgrel=1
pkgdesc="Fork of Wii Backup Fusion fixing the bug with game spliting. The complete and simple to use backup solution for your Wii games"
arch=('i686' 'x86_64')
url="https://github.com/evertonstz/${pkgname}"
license=('GPL')
depends=('wit' 'qt5-base')
makedepends=('gcc' 'wget')

source=("https://github.com/evertonstz/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('d946569bc5348a09e1c9963ebb24e75b95349acaecbb237bd0b161f829341b6e')

build() {
	cd "$pkgname-$pkgver"
	qmake
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    cp "${pkgname}-${pkgver}/bin/WiiBaFu" "${pkgdir}/usr/bin/WiiBaFu"
    cp "${pkgname}-${pkgver}/resources/images/WiiBaFu.png" "${pkgdir}/usr/share/pixmaps/WiiBaFu.png"
    cp "${pkgname}-${pkgver}/resources/WiiBaFu.desktop" "${pkgdir}/usr/share/applications/WiiBaFu.desktop"
}

