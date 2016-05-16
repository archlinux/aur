# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.6.0
pkgrel=1
pkgdesc='GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government'
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
install=$pkgname.install
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver-src.tar.xz)
sha256sums=('5346a942401f69077bc81eac74bc13750a4bda01619094d3a123317c24ef6070')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALL_ROOT="${pkgdir}" install
}

