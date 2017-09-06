# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka
pkgver=4.9.3
pkgrel=1
pkgdesc="GUI application for a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url='https://labs.nic.cz/cs/datovka.html'
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=(https://secure.nic.cz/files/datove_schranky/$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('ee8b026a271af6bb653296646bd7f6cc4910f154a56acbbafd64cbeba09c71dc')

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

