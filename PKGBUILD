# Maintainer: Gergely Imreh <imrehg@gmail.com>
pkgname=xshogi
pkgver=1.4.2
pkgrel=1
pkgdesc="A computer program that plays the game of Shogi, also known as Japanese Chess."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gnushogi/"
license=('GPL')
depends=('gnushogi' 'libxaw')
makedepends=('gcc')
source=(http://ftp.gnu.org/gnu/gnushogi/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2e2f1145e3317143615a764411178f538bd54945646b14fc2264aaeaa105dab6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr/" install
}
