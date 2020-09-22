# Maintainer: Lorenzo Ferrillo <lorenzofer at live dot it>


pkgname=edi
pkgver=0.8.0
pkgrel=1
pkgdesc="EFL based IDE."
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/"
license=('BSD')
depends=('efl' 'bear')
provides=('edi')
#add clang as depend or optdepend
makedepends=('meson' 'ninja' 'check')
source=("https://github.com/Enlightenment/edi/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6a34c6f5afa45589c1836f796880d64b37686a1975cd369ebf467191d17d6806')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson ./build --prefix=/usr
  cd build
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cd ./build 
  DESTDIR="${pkgdir}" ninja install
}
