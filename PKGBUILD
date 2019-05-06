# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.13.1
pkgrel=1
pkgdesc="GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url='https://www.datovka.cz/'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('b6f030253200b55bd8b13b124b0b8aaa1c6f7dc27e2e84c6a8abe0ab90986d96')

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
