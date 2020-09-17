# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Anders Thomsen <mail nospamat andersthomsen nospamdot dk>

pkgname=m-air-edit
pkgver=1.5
pkgrel=3
pkgdesc="Remote control program for MIDAS M-AIR mixers"
arch=('i686' 'x86_64')
url="https://www.midasconsoles.com/downloads.html"
license=('custom:MUSIC Group End User License Agreement')
depends=('libxext' 'alsa-lib' 'freetype2' 'mesa' 'mesa-libgl')
source=("EULA_2012-09-12.pdf"
        "m-air-edit.desktop"
        "m-air-edit.png")
source_i686=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_LINUX_V${pkgver}.tar.gz")
source_x86_64=("https://mediadl.musictribe.com/download/software/midas/M-AIR/M-AIR-Edit_LINUX_X64_V${pkgver}.tar.gz")

md5sums=('20cca5d2623f1029e30e45d64438b253'
         '41c5295a2a715644c3112a77dbd78f4b'
         'de5ae1e21988c134a7ea212c53fe1951')
md5sums_i686=('f6431aa0a773d5ed5a60a89cd9a8d7b2')
md5sums_x86_64=('fed02094c7bd223c256c664e86ead69a')
sha256sums=('3321aa0b3e208133094665281a6fc2ca001628858cd1a6388185eac93569fca8'
            '7f88a5afac7e4097524797a7776f2a6619f4dae8d0cc6449fbb2e118fb6c1a7b'
            '597c3f089725e321c93b639a255f7a9cfbb8208915c22bb5c29b48f51546d74a')
sha256sums_i686=('33a97d49be76effe1f58661f75b26ee96769683a00a0ef22a6da111130deda35')
sha256sums_x86_64=('bd81ca4b10cf7fa6b056f27324a0f6ab4e5beed0dbb55c2f396def245c8fa6d2')
sha512sums=('fe39285768937d82f31844b789d1075de8196495727653595e59f4f1b282f6dbe18a8a8bc51b837f284601dc37c52211d3d494a8636512f5398da31ff3d30284'
            '4ee7e32f1b8b97c866b1b1b197118d128c2a85093cbb84cc0a1806017d0d90b0e991f7d187da92324361acf55d7ed9741882aeb39a6a1189f73f1f5c7e2a9be6'
            '227596e2a4648ce8da0d792d2374fca276092730a57ebcfe8788af6d5ee0ca2b58d8474c5f1d93d556e604fa3c41dc7e6ca556087daf732d1ae42335304ee6d9')
sha512sums_i686=('f7659693754d3ddd0f45abba02d4363abb1efbe4303ade6a8e3283d4ca08bc31bcf2d62097d22a4c65ea6aa66404cf4d0d3df45443b4a0897a2baa71abd7296a')
sha512sums_x86_64=('6fd08607b68de1c7b3d9c003c9c3c761c1966110fd8b2a6aa2fd2eb6c474de56402dcd844d58a2223ccbec203fa132c24b7a4caba275004438aee10d8541654e')


package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    install -m 755 M-AIR-Edit "${pkgdir}"/usr/bin
    install -m 644 EULA_2012-09-12.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/license.pdf
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/share/pixmaps
    install m-air-edit.desktop "${pkgdir}"/usr/share/applications/m-air-edit.desktop
    install m-air-edit.png "${pkgdir}"/usr/share/pixmaps/m-air-edit.png
}
