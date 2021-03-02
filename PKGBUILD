# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

pkgname=m-air-edit-bin
pkgver=1.6
pkgrel=1
pkgdesc="Remote control program for MIDAS M-AIR mixers"
arch=('x86_64')
url="https://www.midasconsoles.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
source=("EULA_2012-09-12.pdf"
        "m-air-edit.desktop"
        "m-air-edit.png")
provides=('m-air-edit')
conflicts=('m-air-edit')
source_x86_64=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_LINUX_${pkgver}.tar.gz")
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '7f88a5afac7e4097524797a7776f2a6619f4dae8d0cc6449fbb2e118fb6c1a7b'
            '597c3f089725e321c93b639a255f7a9cfbb8208915c22bb5c29b48f51546d74a')
sha256sums_x86_64=('e52539aa6d278ab126ca0b6eec79d138eac9bb1885a1121c41fb2130e6929a5f')


package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 755 M-AIR-Edit "${pkgdir}"/usr/bin
    ln -sf M-AIR-Edit "${pkgdir}"/usr/bin/m-air-edit
    install -m 644 EULA_2012-09-12.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/license.pdf
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/pixmaps
    install m-air-edit.desktop "${pkgdir}"/usr/share/applications/m-air-edit.desktop
    install m-air-edit.png "${pkgdir}"/usr/share/pixmaps/m-air-edit.png
}
