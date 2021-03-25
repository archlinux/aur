# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeff Lance <email@jefflance.me>
pkgname=pdfadd
pkgver=2.0
pkgrel=1
epoch=
pkgdesc="Assistants de création de graphiques pour pdflatex/asymptote"
arch=('x86_64')
url="https://xm1math.net/pdfadd"
license=('GPL')
groups=()
depends=('gcc>=3.0' 'gcc-libs' 'glibc>=2.27' 'hicolor-icon-theme' 'libgl' 'libglvnd' 'qt5-base>=5.11.0rc1')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://xm1math.net/pdfadd/pdfadd-${pkgver}.tar.bz2")
sha512sums=('2040d1b7f0ec0ef5f86e6db4ec79a9705aa7f1fd184b1c2a6ce816c9c1184c754b49125b6af174826f19056118a256c6534275635bb9e786c4bb5d990ff063d0')
noextract=()
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="${pkgdir}" DESTDIR="${pkgdir}" install
}
