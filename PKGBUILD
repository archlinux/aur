# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=upplay-qt6-git
pkgver=1.6.1.r48.g398219b
pkgrel=1
pkgdesc="A Qt-based UPnP audio Control point"
url="https://www.lesbonscomptes.com/upplay/"
arch=(x86_64)
license=(GPL2)
depends=(libupnpp qt6-base qt6-webengine jsoncpp)
makedepends=(git qt6-tools)
provides=(upplay)
conflicts=(upplay)
source=("git+https://framagit.org/medoc92/upplay.git")
sha256sums=('SKIP')

pkgver() {
  cd upplay
  git describe --long --tags | sed 's/^UPPLAY_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd upplay
  qmake6 -o Makefile upplay.pro PREFIX=/usr
}

package() {
  cd upplay
  make install INSTALL_ROOT="${pkgdir}"
}
