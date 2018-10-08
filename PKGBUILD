# Maintainer: Mike Polvere <mic.tjs@gmail.com>

pkgname=ucon64-gui
_pkgname=uf-FOX
pkgver=1.1
pkgrel=1
pkgdesc="GUI for Ucon64 (UI also known as uf-FOX), a console ROM backup tool and emulator's Swiss Army knife program. " 
arch=('i686' 'x86_64')
url="http://ucon64.sourceforge.net/index.php"
license=('GPL')
depends=('lib32-libxext' 'lib32-libstdc++5' 'ucon64')
source=(http://downloads.sourceforge.net/ucon64/${_pkgname}-${pkgver}-linux-bin.zip)
sha256sums=('SKIP')

build(){
    rm "${_pkgname}-${pkgver}-linux-bin.zip"
}

package() {
    cd "${_pkgname}-${pkgver}-linux-bin"
    install -Dm644 "gpl.txt" "${pkgdir}/usr/share/doc/${pkgname}/gpl.txt"
    install -Dm644 "README.txt" "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
    install -Dm775 "uf" "${pkgdir}/usr/bin/ucon64-gui"
} 
