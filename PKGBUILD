# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeff Lance <email@jefflance.me>
pkgname=pdfadd
pkgver=2.0.1
pkgrel=1
epoch=
pkgdesc="Charting wizard for pdflatex/asymptote"
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
sha512sums=('e79cde92bac4702cb66a1c7ad71e07d20988b20121dd69d7e5a85bbae256dc276ad37305e9e669767f786cb5905a26e7f3e3837b779b7f84c04337cfaba9d5c3')
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
