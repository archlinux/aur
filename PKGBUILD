# Maintainer: Morten Linderud <foxboron@archlinux.org>

pkgname=smenu
pkgver=0.9.11
pkgrel=1
pkgdesc="Terminal utility that allows you to use words coming from the standard input to create a nice selection window just
below the cursor. Once done, your selection will be sent to standard output."
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
source=("${pkgname}.tar.gz::https://github.com/p-gen/smenu/archive/v${pkgver}.tar.gz")
sha256sums=('ac6b8b94aa5382a0227753bd2c580fd727c7ce19adf72592993dd982b0af478f')

build() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
