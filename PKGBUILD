# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeff Lance <email@jefflance.me>
pkgname=pdfadd
pkgver=2.0.2
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
sha512sums=('000c441ee4ab6fbb87826e9fb9f64173795b290c792e12395d3cddc0bf47abe75f8ad5617db95be0f49d7ac0aedc4616ba5fd18f1f88f5467912e58f143b6732')
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
