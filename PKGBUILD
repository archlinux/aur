# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.9.2
pkgrel=1
pkgdesc="GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('b1d10acdc6f6347f0b976f4c6f3ebdf25feb7f1a9bbdc745cd8a813ae2bc2f5d')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}

