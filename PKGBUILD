# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>

pkgname=libntlm
pkgver=1.7
pkgrel=1
pkgdesc="Libntlm: rewritten of original libntlm"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/libntlm/"
license=('GPL')
depends=()
source=("https://download.savannah.nongnu.org/releases/libntlm/libntlm-${pkgver}.tar.gz")
sha256sums=('d805ebb901cbc9ff411e704cbbf6de4d28e7bcb05c9eca2124f582cbff31c0b1')


build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
