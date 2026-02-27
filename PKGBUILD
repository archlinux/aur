# Maintainer: Marco Sternini <mkarko01@gmail.com>
# Maintainer: Danilo Pianini <danilo.pianini@unibo.it>
pkgname=alchemist
pkgver=43.0.8
pkgrel=1
pkgdesc="An extensible simulator for pervasive computing"
arch=('x86_64')
url="https://alchemistsimulator.github.io"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'freetype2'
#    'gcc-libs'
    'glibc'
#    'giflib'
#    'harfbuzz'
    'java-runtime'
#    'lcms2'
#    'libpng'
#    'libjpeg-turbo'
    'libx11'
    'libxext'
    'libxi'
    'libxrender'
    'libxtst'
#    'zlib'
)
makedepends=()
source=("https://github.com/AlchemistSimulator/Alchemist/releases/download/43.0.8/alchemist-43.0.8-1.$CARCH.rpm")
md5sums=('2d60e9475de7e2fcc4c62649dcc79ebe')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/lib/"
    mkdir -p "${pkgdir}/usr/bin/"

    # Copy the application in usr/lib
    # cp -r "${srcdir}/usr/share/licenses/" "${pkgdir}/usr/share/alchemist/"
    cp -r "${srcdir}/usr/lib/${pkgname}/" "${pkgdir}/usr/lib/"

    # Create a soft link from usr/bin to the application launcher
    ln -s "/usr/lib/${pkgname}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
