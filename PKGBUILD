# Maintainer: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Maintainer: llde 
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
_pkgvermajor=3
_pkgverminor=8
_pkgverpatch=0
pkgver="${_pkgvermajor}.${_pkgverminor}.${_pkgverpatch}"
pkgrel=1

# Generic
pkgdesc="The opensource modeling environment"
arch=('i686' 'x86_64')
url="https://www.modelio.org/"
license=('GPL3')
#groups=()

# Dependencies
depends=('glib2' 'java-runtime' 'libx11' 'libxtst' 'webkit2gtk')
optdepends=('atk' 'gtk2' 'cairo')
#makedepends=()
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=modelio

# Sources
source=("modelio.desktop")
source_i686=("modelio-${pkgver}-i686.deb::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-source${_pkgvermajor}.${_pkgverminor}_${pkgver}_i386.deb/download")
source_x86_64=("modelio-${pkgver}-x86_64.deb::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-source${_pkgvermajor}.${_pkgverminor}_${pkgver}_amd64.deb/download")
#noextract=()
#validpgpkeys=()
sha256sums=('af7e10bb2849fb9cdb2ec0054d782dedd5c6901cbf3e742d1ab872447ae38b5c')
sha256sums_i686=('8cdc9b094807c509d943bcd1b88bbc3c5862c425799f19f05f796446447f3185')
sha256sums_x86_64=('4d3252c0f611172c94d322cfa3e3257bb21adc9c2278f1e411bbbde0b5d21ded')

#pkgver() {
#}

prepare() {
    ar p modelio-${pkgver}-${CARCH}.deb data.tar.xz | tar xJ
}

#build() {
#}

#check() {
#}

package() {
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/opt/modelio"
    install -Dm755 "${srcdir}/modelio.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}"/usr/lib/modelio-open-source${_pkgvermajor}.${_pkgverminor}/* "${pkgdir}/opt/modelio/"
}
