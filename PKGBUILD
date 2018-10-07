# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=ucon64-gui
pkgver=2.0.0
pkgrel=13
pkgdesc="GUI for Ucon64 (UI also known as uf-FOX), a console ROM backup tool and emulator's Swiss Army knife program. " 
arch=('i586' 'x86_64')
url="http://ucon64.sourceforge.net/index.php"
license=('GPL')
depends=('gcc-libs' 'glibc' 'fox-devel' 'ucon64')
source=(http://mirror.rosalab.ru/rosa/rosa2016.1/repository/${CARCH}/contrib/release//${pkgname}-${pkgver}-13-rosa2016.1.${CARCH}.rpm)
sha256sums=('SKIP')

build(){
    rm "${pkgname}-${pkgver}-13-rosa2016.1.${CARCH}.rpm"
}

package() {
    cd "usr"
    install -Dm644 "share/doc/${pkgname}/gpl.txt" "${pkgdir}/usr/share/doc/${pkgname}/gpl.txt"
    install -Dm644 "share/doc/${pkgname}/README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm775 "bin/uf" "${pkgdir}/usr/bin/ucon64-gui"
} 
