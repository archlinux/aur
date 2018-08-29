# Maintainer: epitron <chris AT ill-logic.com>

pkgname=ansilove
pkgver=3.0.9
pkgrel=1
pkgdesc='A program to convert ANSI and artscene related file formats into PNG images'
url='https://ansilove.org/'
license=('BSD')
depends=('gd')
makedepends=('git' 'cmake' 'gcc')
source=("https://github.com/ansilove/ansilove/archive/${pkgver}.tar.gz")
sha256sums=('3117b083f3a97da6f3d24963d46b83af2fb6967c5c33940d0b097386f338b919')
arch=('x86_64' 'i686')

build() {
  cd "${srcdir}/ansilove-${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/ansilove-${pkgver}"
  make install

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/ansilove/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/ansilove/README.md"
}

