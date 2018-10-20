# Maintainer: Lorenzo Ferrillo <lorenzofer at live dot it>


pkgname=edi
pkgver=0.7.0
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
sha256sums=('4b605053a5737f250ab2dc46d208f2fb20d91e05fbdd8dbf64531fa509709b59')

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
