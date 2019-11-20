# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.14.1
pkgrel=1
pkgdesc="GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url='https://www.datovka.cz/'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('6676df789db928db3fb6246a196de9bcfdfb2e8ef2a6bf4912e7f02faaee364a')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  lrelease-qt5 datovka.pro
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}
