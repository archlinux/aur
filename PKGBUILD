# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Various

_pkgname=openmeca
pkgname=openmeca-git
pkgver=2.3.0.r1.g5a6f1824
pkgrel=1
pkgdesc="Simulating mechanical systems easily"
license=('GPL')
arch=('i686' 'x86_64')
url="https://gitlab.com/damien.andre/openmeca"
depends=('boost-libs' 'libqglviewer' 'qwt' 'qt5-base' 'qt5-declarative' 'qt5-svg' 'qt5-tools' 'qwt')
makedepends=('git')
source=("git+https://gitlab.com/damien.andre/openmeca.git")
sha1sums=('SKIP')


pkgver() {
  cd "${_pkgname}"/SRC/OpenMeca
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  # Build the custom chronoengine and openmeca
  make all
}

package() {
  cd "${_pkgname}"
  make DESTDIR="$pkgdir" install
}

