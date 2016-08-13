# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.6.1
pkgrel=1
pkgdesc='GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government'
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver-src.tar.xz)
sha256sums=('816757f2575dfde9b23d4b25ec7db58dbba5f2e3283dd5058d1bb8ddc0c0913b')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}

