# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.2.1
pkgrel=1
pkgdesc='GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government'
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
install=$pkgname.install
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver-src.tar.xz)
md5sums=('73b8dfc7261e3d93efd036a302d580bf')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}

