# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=perwindowlayoutd
_pkgname=perwindowlayout
pkgver=0.6
pkgrel=1
pkgdesc="Keeps per window keyboard layout under X11"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/perwindowlayout"
license=('GPL')
depends=('libx11' 'gcc-libs')
source=("http://downloads.sourceforge.net/${_pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5a0172bf1351e1de2dc3c29363859550')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
