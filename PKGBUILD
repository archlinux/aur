# Maintainer: Marco Sternini <mkarko01@gmail.com>
# Maintainer: Danilo Pianini <danilo.pianini@unibo.it>
pkgname=alchemist
pkgver=30.0.2
pkgrel=1
pkgdesc="An extensible simulator for pervasive computing"
arch=('x86_64')
url="https://github.com/AlchemistSimulator/Alchemist"
license=('GPL')
depends=('glibc' 'libxrender' 'libxtst' 'libxi' 'libx11' 'freetype2' 'alsa-lib' 'libxext')
makedepends=()
source=("https://github.com/AlchemistSimulator/Alchemist/releases/download/30.0.2/alchemist-30.0.2-1.x86_64.rpm")
md5sums=('6036b625440996993bfbe2a5de26eea6')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"

    # Copy the application in usr/lib
    cp -r "${srcdir}/usr/share/licenses/" "${pkgdir}/usr/share/alchemist/" 
    cp -r "${srcdir}/opt/${pkgname}/" "${pkgdir}/usr/lib/" 

    # Create a soft link from usr/bin to the application launcher
    ln -s "/usr/lib/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
