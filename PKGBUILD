# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.4.0
pkgrel=1
pkgdesc='GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government'
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
install=$pkgname.install
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver-src.tar.xz)
sha256sums=('4551ba7fd9ca5490f1772209ee3903f2f9c328f44dcc35ec070cc16b4a31561f')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}

