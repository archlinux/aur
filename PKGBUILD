# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.4.3
pkgrel=1
pkgdesc='GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government'
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
install=$pkgname.install
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver-src.tar.xz)
sha256sums=('0fb5f7cf493662de33d3d66efc157fd38ab46380fc33066a5bb208dae61db25d')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}

