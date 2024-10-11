# Maintainer: Taleiven Kattan <taleiven at gmail dot com>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Contributor: llde 
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
_pkgvermajor=5
_pkgverminor=4
_pkgverpatch=1
pkgver="${_pkgvermajor}.${_pkgverminor}.${_pkgverpatch}"
pkgrel=0

# Generic
pkgdesc="The opensource modeling environment"
arch=('x86_64')
url="https://www.modelio.org/"
license=('GPL3')
#groups=()

# Dependencies
depends=('glib2' 'glibc' 'webkit2gtk' 'at-spi2-core' 'gtk3')
optdepends=('gtk2' 'webkitgtk2')
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
source=("modelio.desktop" "modelio.patch")
source_x86_64=("modelio-${pkgver}-x86_64.deb::https://github.com/ModelioOpenSource/Modelio/releases/download/v${pkgver}/modelio-open-source-${pkgver}_amd64.deb")
#noextract=()
#validpgpkeys=()
sha256sums=('ea0233daf57b51b05f0a0322217ebbab02b41864dd56ea31bd057a506e1f8249'
            'bc87a815e0af78ece34ccbc878b88b17b9b00557a98c113cefc9b4111462dbbb')
sha256sums_x86_64=('720eebb886293a0cf69df6b1dfb33cb14b3cf50bdb6f93ccb9dc91d19362511a')

#pkgver() {
#}

prepare() {
    ar p modelio-${pkgver}-${CARCH}.deb data.tar.xz | tar xJ
#    cd "${srcdir}/usr/lib/modelio-open-source${_pkgvermajor}.${_pkgverminor}"
#    patch --input=${srcdir}/modelio.patch modelio.sh
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
