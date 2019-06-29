# Maintainer: Lorenzo Ferrillo <lorenzofer at live dot it>


pkgname=edi
pkgver=0.7.1
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
sha256sums=('6c7ee847cac6c7b074cb70a3bca00bee5ab4aae37a7b6eb6bad4c15965950704')

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
