# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.15.1
pkgrel=1
pkgdesc="GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url='https://www.datovka.cz/'
license=('LGPL')
depends=('qt5-base' 'qt5-svg' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'patch')
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('795ca1eaff172a6826b60430916aa0d9ff29cac8aac868a5631de76f72d06129')

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
