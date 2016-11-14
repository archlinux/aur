# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# umldesigner-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=umldesigner-bin

# Version
pkgver=7.1.0
pkgrel=1
#epoch=

# Generic
pkgdesc="Graphical tooling to edit and visualize UML models"
arch=('i686' 'x86_64')
url="http://www.umldesigner.org/"
license=('EPL')
#groups=()

# Dependencies
#depends=('')
#optdepends=()
#makedepends=('maven' 'ruby')
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=
changelog=changelog

# Sources
source=("umldesigner.desktop")
source_i686=("https://s3-eu-west-1.amazonaws.com/obeo-umldesigner-releases/${pkgver}/bundles/UMLDesigner-linux.gtk.x86.zip")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/obeo-umldesigner-releases/${pkgver}/bundles/UMLDesigner-linux.gtk.x86_64.zip")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=('')
#sha1sums=()
sha256sums=('bad49af9547d18919bf9aee581bc1bc9dd35fced3594179df12bb4a1588dc5da')
sha256sums_i686=('3f5584d9b4c30d20af987fb7ca586491d9aa9e0cfaf169ad1924c53802e29410')
sha256sums_x86_64=('dfe527425fb48c2e48a20dc210dcd25285a0db68631838f5cc3a562e1288c93d')

#pkgver() {
#}

#prepare() {
#}

#build() {
#}

#check() {
#}

package() {
  install -dm755 "$pkgdir/usr/share/applications/"
  install -dm755 "$pkgdir/usr/bin/"
  install -dm755 "${pkgdir}/opt/UMLDesigner"
  install -Dm755 "$srcdir/umldesigner.desktop" "$pkgdir/usr/share/applications/"
  cp -r ${srcdir}/UMLDesigner/* "${pkgdir}/opt/UMLDesigner/"
  ln -s "/opt/UMLDesigner/UMLDesigner" "${pkgdir}/usr/bin/UMLDesigner"
}
