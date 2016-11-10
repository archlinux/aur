# Maintainer: Ian Ker-Seymer <i.kerseymer@gmail.com>

pkgname=neovim-qt
pkgdesc="Neovim client library and GUI, in Qt5."
license=('ISC')
pkgver=0.2.4
pkgrel=1
depends=('neovim' 'qt5-base')
makedepends=('cmake')
provides=('neovim-qt')
arch=('i686' 'x86_64')
url='https://github.com/equalsraf/neovim-qt'
source=("https://github.com/equalsraf/neovim-qt/archive/v${pkgver}.tar.gz")
sha256sums=('b68c996386bade219c98d6e4446026f9285d033010f16a7a0695befa6737af3f')
install=neovim-qt.install

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  cmake "../neovim-qt-${pkgver}"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/neovim-qt-${pkgver}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=2 et:
