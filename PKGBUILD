# Maintainer: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Maintainer: llde 
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
pkgver=3.6.1
pkgrel=1

# Generic
pkgdesc="The opensource modeling environment"
arch=('i686' 'x86_64')
url="https://www.modelio.org/"
license=('GPL3')
#groups=()

# Dependencies
depends=('libxtst' 'libstdc++5' 'webkitgtk2' 'glib2')
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
changelog=changelog

# Sources
source=("modelio.desktop" "changelog")
source_i686=("modelio-${pkgver}-i686::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-source-${pkgver}_i386.deb/download")
source_x86_64=("modelio-${pkgver}-x86_64::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-source-${pkgver}_amd64.deb/download
")
#noextract=()
#validpgpkeys=()
sha256sums=('SKIP'
            'SKIP')
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')

#pkgver() {
#}

prepare() {
    ar p modelio-${pkgver}-${CARCH} data.tar.gz | tar zx
}

#build() {
#}

#check() {
#}

package() {
    install -dm755 "${pkgdir}/usr/share/applications/"
    install -dm755 "${pkgdir}/opt/modelio"
    install -Dm755 "${srcdir}/modelio.desktop" "${pkgdir}/usr/share/applications/"
    cp -r "${srcdir}"/usr/lib/modelio-open-source3.6/* "${pkgdir}/opt/modelio/"
}
