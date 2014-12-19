# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=datovka-git
pkgver=4.0.2
pkgrel=1
pkgdesc="GUI application allowing access to a 'Databox' - an electronic communication interface endorsed by the Czech government"
arch=('i686' 'x86_64')
url="https://gitlab.labs.nic.cz/labs/qdatovka"
license=('LGPL')
depends=('qt5-base' 'libisds' 'openssl' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')
conflicts=('qdatovka' 'datovka')
provides=('datovka')
install=$pkgname.install
source=(git+https://gitlab.labs.nic.cz/labs/qdatovka.git)
md5sums=('SKIP')

build() {
  cd qdatovka

  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd qdatovka

  make INSTALL_ROOT="${pkgdir}" install
}
