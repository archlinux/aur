# Maintainer: Lorenzo Ferrillo <lorenzofer at live dot it>


pkgname=edi
pkgver=0.6.1
pkgrel=1
pkgdesc="EFL based IDE."
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/"
license=('BSD')
depends=('efl' 'bear')
provides=('edi')
#add clang as depend or optdepend
makedepends=('meson' 'ninja')
source=("https://github.com/Enlightenment/edi/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a85519a75dd114cf32c4ffc6e0957bdc0f18f5a3c1d85d0c74e0f302ca68d02b')

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
