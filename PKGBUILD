# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# umldesigner-bin
# Contributing: https://gitlab.com/aur-ci/umldesigner-bin.git
# Builds: https://gitlab.com/aur-ci/umldesigner-bin/builds
#pkgbase=
pkgname=umldesigner-bin

# Version
pkgver=6.0.0
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
#install=actor
changelog=changelog

# Sources
source=("umldesigner.desktop")
source_i686=("https://s3-eu-west-1.amazonaws.com/obeo-umldesigner-releases/6.0.0/UMLDesigner-linux.gtk.x86.zip")
source_x86_64=("https://s3-eu-west-1.amazonaws.com/obeo-umldesigner-releases/6.0.0/UMLDesigner-linux.gtk.x86_64.zip")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=('')
#sha1sums=()
sha256sums=('SKIP')
sha256sums_i686=('ebaabf3dc2a9453f861556d4b7d57bfa9889d4aee43b9d26eba2823a5d8fae1d')
sha256sums_x86_64=('e74878eefe8a2f1638139a62906f87b4528f5103b2c17323c90e644420f427e3')

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
